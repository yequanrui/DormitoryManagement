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
///Repair 的摘要说明
/// </summary>
namespace StudentApartment.BusinessLogicLayer
{
    public class Repair
    {
        private int repairId;          //报修流水号
        private string apartmentNo;    //公寓号
        private string roomNo;         //房间号
        private string studentNumber;  //报修人学号
        private string studentName;  //报修人姓名
        private string studentTelephone;  //报修人手机号码
        private string roomTelephone;  //房间电话
        private DateTime repairTime;   //报修时间
        private string repairThing;    //报修物品
        private string repairQuantity; //报修数量
        private string repairReason;   //报修原因
        private string repairAduit;    //报修审核
        private string repairResult;   //报修结果
        private string errMessage;　   //错误信息

        //各个字段对应的属性
        #region MyRegion
        public int RepairId
        {
            set
            {
                this.repairId = value;
            }
            get
            {
                return this.repairId;
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
        public string StudentNumber
        {
            set
            {
                this.studentNumber = value;
            }
            get
            {
                return this.studentNumber;
            }
        }
        public string StudentName
        {
            set
            {
                this.studentName = value;
            }
            get
            {
                return this.studentName;
            }
        }
        public string StudentTelephone
        {
            set
            {
                this.studentTelephone = value;
            }
            get
            {
                return this.studentTelephone;
            }
        }
        public string RoomTelephone
        {
            set
            {
                this.roomTelephone = value;
            }
            get
            {
                return this.roomTelephone;
            }
        }
        public DateTime RepairTime
        {
            set
            {
                this.repairTime = value;
            }
            get
            {
                return this.repairTime;
            }
        }
        public string RepairThing
        {
            set
            {
                this.repairThing = value;
            }
            get
            {
                return this.repairThing;
            }
        }
        public string RepairQuantity
        {
            set
            {
                this.repairQuantity = value;
            }
            get
            {
                return this.repairQuantity;
            }
        }
        public string RepairReason
        {
            set
            {
                this.repairReason = value;
            }
            get
            {
                return this.repairReason;
            }
        }
        public string RepairAduit
        {
            set
            {
                this.repairAduit = value;
            }
            get
            {
                return this.repairAduit;
            }
        }
        public string RepairResult
        {
            set
            {
                this.repairResult = value;
            }
            get
            {
                return this.repairResult;
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

        public Repair()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }

        //向数据库中加入新的报修信息，成功返回true
        public bool AddRepairInfo()
        {
            string insertString = "insert into repairInfo(apartmentNo,roomNo,studentNumber,repairTime,repairThing,repairQuantity,repairReason) values (";
            insertString += SqlString.GetQuotedString(this.apartmentNo) + ",";
            insertString += SqlString.GetQuotedString(this.roomNo) + ",";
            insertString += SqlString.GetQuotedString(this.studentNumber) + ",";
            insertString += SqlString.GetQuotedString(this.repairTime.ToString("yyyy-MM-dd HH:mm:ss")) + ",";
            insertString += SqlString.GetQuotedString(this.repairThing) + ",";
            insertString += SqlString.GetQuotedString(this.repairQuantity) + ",";
            insertString += SqlString.GetQuotedString(this.repairReason) + ")";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(insertString) > 0)
            {
                this.ErrMessage = "<font color=red>报修信息登记成功!</font>";
                return true;
            }
            else
            {
                this.ErrMessage = "<font color=red>登记报修信息时发生了错误!</font>";
                return false;
            }
        }

        //查询所有的报修信息
        public DataSet GetAllRepair()
        {
            string queryString = "select * from repairView";
            return (new DataBase()).GetDataSet(queryString);
        }

        //查询已审核的报修信息
        public DataSet GetAuditedRepair()
        {
            string queryString = "select * from repairInfo where repairAduit is not null and repairResult is not null";
            return (new DataBase()).GetDataSet(queryString);
        }

        //根据报修流水号得到正在审核中的报修信息并保存到各个字段中
        public bool GetRepairInfo(int repairId)
        {
            string queryString = "select * from repairView where repairId=" + repairId;
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            DataRow dr = ds.Tables[0].Rows[0];
            if ((dr["repairAduit"].ToString() != "")&&(dr["repairResult"].ToString() != ""))
            {
                this.errMessage = "该报修信息已审核！";
                return false;
            }
            else
            {
                repairId = Convert.ToInt32(dr["repairId"].ToString());
                apartmentNo = dr["apartmentNo"].ToString();
                roomNo = dr["roomNo"].ToString();
                studentName = dr["studentName"].ToString();
                studentTelephone=dr["studentTelephone"].ToString();
                roomTelephone = dr["roomTelephone"].ToString();
                repairTime = DateTime.Parse(dr["repairTime"].ToString());
                repairThing = dr["repairThing"].ToString();
                repairQuantity = dr["repairQuantity"].ToString();
                repairReason = dr["repairReason"].ToString();
                repairAduit = dr["repairAduit"].ToString();
                repairResult = dr["repairResult"].ToString();
                return true;
            }
        }

        //根据报修流水号对报修信息进行审核操作
        public bool UpdateRepairInfo()
        {
            string updateString = "update repairInfo set repairAduit=" + SqlString.GetQuotedString(this.repairAduit);
            updateString += ",repairResult=" + SqlString.GetQuotedString(this.repairResult);
            updateString += " where repairId=" + this.repairId;
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