using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using StudentApartment.DataAccessLayer;
using StudentApartment.DataAccessHelper;

/// <summary>
///Illegal 的摘要说明
/// </summary>
namespace StudentApartment.BusinessLogicLayer
{
    public class Illegal
    {
        private int illegalId;        //违规流水号
        private string apartmentNo;   //公寓号
        private string roomNo;        //房间号
        private DateTime illegalTime; //迁出时间
        private string illegalReason; //违规原因
        private string illegalSolve;  //违规处理
        private string illegalScore;  //违规扣分
        private string errMessage;　  //错误信息

        //各个字段对应的属性
        #region MyRegion
        public int IllegalId 
        {
            set
            {
                this.illegalId = value;
            }
            get
            {
                return this.illegalId;
            }
        }
        public string ApartmentNo
        {
            set
            {
                this.apartmentNo = value;
            }
            get
            {
                return this.apartmentNo;
            }
        }
        public string RoomNo
        {
            set
            {
                this.roomNo = value;
            }
            get
            {
                return roomNo;
            }
        }
        public DateTime IllegalTime
        {
            set
            {
                this.illegalTime = value;
            }
            get
            {
                return this.illegalTime;
            }
        }
        public string IllegalReason
        {
            set
            {
                this.illegalReason = value;
            }
            get
            {
                return this.illegalReason;
            }
        }
        public string IllegalSolve
        {
            set
            {
                this.illegalSolve = value;
            }
            get
            {
                return this.illegalSolve;
            }
        }
        public string IllegalScore
        {
            set
            {
                this.illegalScore = value;
            }
            get
            {
                return this.illegalScore;
            }
        }
        public string ErrMessage
        {
            set
            {
                this.errMessage = value;
            }
            get
            {
                return this.errMessage;
            }
        }

        #endregion

        public Illegal()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }
        
        //向数据库中加入新的违规信息，成功返回true
        public bool AddIllegalInfo()
        {
            string insertString = "insert into illegalInfo(apartmentNo,roomNo,illegalTime,illegalReason) values (";
            insertString = insertString + SqlString.GetQuotedString(this.apartmentNo) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.roomNo) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.illegalTime.ToString("yyyy-MM-dd HH:mm:ss")) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.illegalReason) + ")";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(insertString) > 0)
            {
                this.ErrMessage = "<font color=red>违规信息登记成功!</font>";
                return true;
            }
            else
            {
                this.ErrMessage = "<font color=red>登记违规信息时发生了错误!</font>";
                return false;
            }
        }

        //查询所有的违规信息
        public DataSet GetAllIllegal()
        {
            string queryString = "select * from illegalInfo";
            return (new DataBase()).GetDataSet(queryString);
        }

        //查询正在处理的违规信息
        public DataSet GetSolvingIllegal()
        {
            string queryString = "select * from illegalInfo where illegalSolve is not null and illegalScore is not null";
            return (new DataBase()).GetDataSet(queryString);
        }

        //根据违规流水号得到正在处理中的违规信息并保存到各个字段中
        public bool GetIllegalInfo(int illegalId)
        {
            string queryString = "select * from illegalInfo where illegalId=" + illegalId;
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            DataRow dr = ds.Tables[0].Rows[0];
            if ((dr["illegalSolve"].ToString() != "") && (dr["illegalScore"].ToString() != ""))
            {
                this.errMessage = "该违规信息已审核！";
                return false;
            }
            else
            {
                illegalId = Convert.ToInt32(dr["illegalId"].ToString());
                apartmentNo = dr["apartmentNo"].ToString();
                roomNo = dr["roomNo"].ToString();
                illegalTime = DateTime.Parse(dr["illegalTime"].ToString());
                illegalReason = dr["illegalReason"].ToString();
                illegalSolve = dr["illegalSolve"].ToString();
                illegalScore = dr["illegalScore"].ToString();
                return true;
            }
        }

        //根据违规流水号对违规信息进行处理操作
        public bool UpdateSolvingIllegal()
        {
            string updateString = "update illegalInfo set illegalSolve=" + SqlString.GetQuotedString(this.illegalSolve);
            updateString += ",illegalScore=" + SqlString.GetQuotedString(this.illegalScore);
            updateString += " where illegalId=" + this.illegalId;
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) < 0)
            {
                this.errMessage = "数据更新时发生了错误!";
                return false;
            }
            return true;
        }
    }
}