using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using StudentApartment.DataAccessHelper;
using StudentApartment.DataAccessLayer;

/// <summary>
/// Live 的摘要说明
/// </summary>
/// 
namespace StudentApartment.BusinessLogicLayer
{
    public class Live
    {
        private string studentNumber; //学生学号
        private string studentName;   //学生姓名
        private string apartmentNo;   //所在公寓号
        private string roomNo;        //所在房间号
        private int liveinYear;       //入住年份
        private int liveinMonth;      //入住月份
        private int liveinDay;        //入住日
        private string liveMemo;      //备注信息
        private DateTime outTime;     //迁出时间
        private string outReason;     //迁出原因
        private string errMessage;　  //错误信息

        //各个字段对应的属性
        #region MyRegion 
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
        public int LiveinYear
        {
            set
            {
                this.liveinYear = value;
            }
            get
            {
                return this.liveinYear;
            }
        }
        public int LiveinMonth
        {
            set
            {
                this.liveinMonth = value;
            }
            get
            {
                return this.liveinMonth;
            }
        }
        public int LiveinDay
        {
            set
            {
                this.liveinDay = value;
            }
            get
            {
                return this.liveinDay;
            }
        }
        public string LiveMemo
        {
            set
            {
                this.liveMemo = value;
            }
            get
            {
                return this.liveMemo;
            }
        }
        public DateTime OutTime
        {
            set
            {
                this.outTime = value;
            }
            get
            {
                return this.outTime;
            }
        }
        public string  OutReason
        {
            set
            {
                this.outReason = value;
            }
            get
            {
                return this.outReason;
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
        
        public Live()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        //学生入住房间业务功能函数
        public bool AddLiveInfo()
        {
            //首先检查操作员输入的学号信息是否存在
            string queryString = "select * from studentInfo where studentNumber=" + SqlString.GetQuotedString(studentNumber);
            DataBase db = new DataBase();
            if (false == db.GetRecord(queryString))
            {
                this.ErrMessage = "你输入学号的学生信息不存在！";
                return false;
            }

            //然后检查该学号的学生是否已经登记了入住信息
            queryString = "select * from liveInfo where studentNumber=" + SqlString.GetQuotedString(studentNumber);
            if (db.GetRecord(queryString))
            {
                this.ErrMessage = "对不起，该学生已经入住公寓了！";
                return false;
            }

            //然后检查要入住的房间人员是否已经满了，通过剩余床位判断
            Room room = new Room();
            int leftNumberBed = room.GetLeftNumberOfBed(roomNo);
            if (leftNumberBed <= 0)
            {
                this.ErrMessage = "对不起，目标房间没有剩余床位容纳学生了!";
                return false;
            }

            //通过了上面的几个验证后说明数据都是输入合法的进行入住的登记了
            string insertString = "insert into liveInfo(studentNumber,apartmentNo,roomNo,liveinYear,liveinMonth,liveinDay,liveMemo) values (";
            insertString += SqlString.GetQuotedString(studentNumber) + ",";
            insertString += SqlString.GetQuotedString(apartmentNo) + ",";
            insertString += SqlString.GetQuotedString(roomNo) + ",";
            insertString += this.liveinYear+ ",";
            insertString += this.liveinMonth + ",";
            insertString += this.liveinDay + ",";
            insertString += SqlString.GetQuotedString(liveMemo) + ")";
            string updateString = "update roomInfo set leftNumberOfBed = leftNumberOfBed - 1 where roomNo=" + SqlString.GetQuotedString(roomNo);
            string[] sqlstring = new string[] { insertString, updateString };
            if (!db.ExecuteSQL(sqlstring))
            {
                this.ErrMessage = "对不起，执行数据库操作时发生了错误!";
                return false;
            }
            return true;
        }

        //根据学号得到该学生的入住时间
        public string GetLiveTime(string studentNumber)
        {
            string queryString = "select liveinYear,liveinMonth,liveinDay from liveInfo where studentNumber=" + SqlString.GetQuotedString(studentNumber);
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0)
                return "";
            DataRow dr = ds.Tables[0].Rows[0];
            return dr[0].ToString() + "年" + dr[1].ToString() + "月" + dr[2].ToString() + "日";
        }

        //查询所有的入住信息
        public DataSet GetAllLive()
        {
            string queryString = "select * from liveInfoView";
            return (new DataBase()).GetDataSet(queryString);
        }

        //根据查询条件执行入住信息的查询
        public DataSet GetQueryLiveInfo(string studentNumber, string studentName, string apartmentNo, string roomNo)
        {
            string queryString = "select * from liveInfoView where studentNumber like '%" + studentNumber + "%'";
            queryString += " and studentName like '%" + studentName + "%'";
            queryString += " and apartmentNo = " + SqlString.GetQuotedString(apartmentNo);
            queryString += " and roomNo = " + SqlString.GetQuotedString(roomNo);
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds;
        }

        //根据学号得到对应的住宿信息并保存到相应的属性中
        public bool GetLiveInfo(string studentNumber)
        {
            string queryString = "select * from liveInfoView where studentNumber=" + SqlString.GetQuotedString(studentNumber);
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0)
            {
                this.errMessage = "没有找到对应学号学生的住宿信息";
                return false;
            }
            DataRow dr = ds.Tables[0].Rows[0];
            if (dr["outTime"].ToString() != "")
            {
                this.errMessage = "该学号学生已登记迁出！";
                return false;
            }
            else
            {
                this.studentNumber = studentNumber;
                this.apartmentNo = dr["apartmentNo"].ToString();
                this.roomNo = dr["roomNo"].ToString();
                this.liveinYear = Convert.ToInt16(dr["liveinYear"].ToString());
                this.liveinMonth = Convert.ToInt16(dr["liveinMonth"].ToString());
                this.liveinDay = Convert.ToInt16(dr["liveinDay"].ToString());
                this.liveMemo = dr["liveMemo"].ToString();
                return true;
            }
        }

        //根据学号得到对应的迁出信息并保存到相应的属性中
        public bool GetOutInfo(string studentNumber)
        {
            string queryString = "select * from liveInfoView where studentNumber=" + SqlString.GetQuotedString(studentNumber);
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            DataRow dr = ds.Tables[0].Rows[0];
            if (dr["outTime"].ToString() != "")
            {
                this.errMessage = "该学号学生已登记迁出！";
                return false;
            }
            else
            {
                this.studentNumber = studentNumber;
                this.studentName = dr["studentName"].ToString();
                this.apartmentNo = dr["apartmentNo"].ToString();
                this.roomNo = dr["roomNo"].ToString();
                return true;
            }
        }

        //根据学生的学号执行该学生的迁出信息的添加
        public bool AddOutInfo()
        {
            string updateLiveString = "update liveInfo set outTime=" + SqlString.GetQuotedString(this.outTime.ToString("yyyy-MM-dd"));
            updateLiveString += ",outReason=" + SqlString.GetQuotedString(this.outReason);
            updateLiveString += " where studentNumber=" + SqlString.GetQuotedString(this.studentNumber);
            string updateRoomString = "update roomInfo set leftNumberOfBed = leftNumberOfBed + 1 where roomNo =" + SqlString.GetQuotedString(roomNo);
            string[] sqlstrings = new string[]{updateLiveString, updateRoomString};
            DataBase db = new DataBase();
            if (!db.ExecuteSQL(sqlstrings))
            {
                this.ErrMessage = "对不起，迁出操作时发生了错误!";
                return false;
            }
            return true;
        }

        //用新的住宿信息更新该学生的住宿信息
        public bool UpdateLiveInfo()
        {
            //首先查询目标房间是否还有剩余床位
            Room room = new Room();
            int leftNumberOfBed = room.GetLeftNumberOfBed(this.roomNo);
            if (leftNumberOfBed <= 0)
            {
                this.errMessage = "对不起，目标房间没有剩余床位了！";
                return false;
            }
            //将老房间的剩余床位数加一，将新房间的剩余床位数减1
            string oldRoomNo = this.GetOldRoomNo(); //得到原来的住宿房间编号
            string updateOldRoomString, updateNewRoomString, updateLiveString;
            updateOldRoomString = "update roomInfo set leftNumberOfBed = leftNumberOfBed + 1 where roomNo=" + SqlString.GetQuotedString(oldRoomNo);
            updateNewRoomString = "update roomInfo set leftNumberOfBed = leftNumberOfBed - 1 where roomNo=" + SqlString.GetQuotedString(this.roomNo);
            updateLiveString = "update liveInfo set apartmentNo=" + SqlString.GetQuotedString(this.apartmentNo);
            updateLiveString += ",roomNo=" + SqlString.GetQuotedString(this.roomNo);
            updateLiveString += ",liveinYear=" + this.liveinYear;
            updateLiveString += ",liveinMonth=" + this.liveinMonth;
            updateLiveString += ",liveinDay=" + this.LiveinDay;
            updateLiveString += ",liveMemo=" + SqlString.GetQuotedString(this.liveMemo);
            updateLiveString += " where studentNumber=" + SqlString.GetQuotedString(this.studentNumber);
            string[] updateSqls = new string[]{updateOldRoomString,updateNewRoomString,updateLiveString};
            DataBase db = new DataBase();
            if (!db.ExecuteSQL(updateSqls))
            {
                this.errMessage = "更换房间操作时发生了错误！";
                return false;
            }
            return true;
        }

        //得到该学生原来的入住房间编号
        public string GetOldRoomNo()
        {
            string queryString = "select roomNo from liveInfo where studentNumber=" + SqlString.GetQuotedString(this.studentNumber);
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count > 0)
                return ds.Tables[0].Rows[0]["roomNo"].ToString();
            return String.Empty;
        }

        //根据学号得到该生居住房间的价格
        public float GetRoomPrice(string studentNumber)
        {
            string queryString = "select roomPrice from roomInfo,liveInfo where roomInfo.roomNo = liveInfo.roomNo and liveInfo.studentNumber=" + SqlString.GetQuotedString(studentNumber);
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count > 0)
                return Convert.ToSingle(ds.Tables[0].Rows[0]["roomPrice"]);
            return 0.0f;
        }
    }
}
