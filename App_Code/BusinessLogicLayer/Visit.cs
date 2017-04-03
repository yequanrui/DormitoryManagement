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
///Visit 的摘要说明
/// </summary>
namespace StudentApartment.BusinessLogicLayer
{
    public class Visit
    {
        private string interviewee;   //被访人
        private string interviewer;   //来访人
        private string relation;      //关系
        private string apartmentNo;   //所在公寓号
        private string roomNo;        //所在房间号
        private string managerName;   //管理员名字
        private DateTime beginTime;   //来访时间
        private DateTime endTime;     //结束时间
        private string interviewMemo; //备注信息
        private string errMessage;　  //错误信息

        //各个字段对应的属性
        #region MyRegion
        public string Interviewee
        {
            set
            {
                this.interviewee = value;
            }
            get
            {
                return this.interviewee;
            }
        }
        public string Interviewer
        {
            set
            {
                this.interviewer = value;
            }
            get
            {
                return this.interviewer;
            }
        }
        public string Relation
        {
            set
            {
                this.relation = value;
            }
            get
            {
                return this.relation;
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
        public string ManagerName
        {
            set
            {
                this.managerName = value;
            }
            get
            {
                return this.managerName;
            }
        }
        public DateTime BeginTime
        {
            set
            {
                this.beginTime = value;
            }
            get
            {
                return this.beginTime;
            }
        }
        public DateTime EndTime
        {
            set
            {
                this.endTime = value;
            }
            get
            {
                return this.endTime;
            }
        }
        public string InterviewMemo
        {
            set
            {
                this.interviewMemo = value;
            }
            get
            {
                return this.interviewMemo;
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

        public Visit()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }

        public bool InsertVisitInfo()
        {
            //首先检查操作员输入的被访人信息是否存在
            string queryString = "select * from studentInfo where studentName=" + SqlString.GetQuotedString(interviewee);
            DataBase db = new DataBase();
            if (false == db.GetRecord(queryString))
            {
                this.ErrMessage = "你输入被访人信息不存在！";
                return false;
            }
            //通过了验证后进行来访登记
            string insertString = "insert into visitInfo(interviewee,interviewer,relation,apartmentNo,roomNo,managerName,beginTime,endTime,interviewMemo) values (";
            insertString += SqlString.GetQuotedString(interviewee) + ",";
            insertString += SqlString.GetQuotedString(interviewer) + ",";
            insertString += SqlString.GetQuotedString(relation) + ",";
            insertString += SqlString.GetQuotedString(apartmentNo) + ",";
            insertString += SqlString.GetQuotedString(roomNo) + ",";
            insertString += SqlString.GetQuotedString(managerName) + ",";
            insertString += SqlString.GetQuotedString(this.beginTime.ToString("yyyy-MM-dd HH:mm:ss")) + ",";
            insertString += SqlString.GetQuotedString(this.endTime.ToString("yyyy-MM-dd HH:mm:ss")) + ",";
            insertString += SqlString.GetQuotedString(interviewMemo) + ")";
            if (db.InsertOrUpdate(insertString) > 0)
            {
                this.ErrMessage = "<font color=red>来访信息登记成功!</font>";
                return true;
            }
            else
            {
                this.ErrMessage = "<font color=red>登记来访信息时发生了错误!</font>";
                return false;
            }
        }

        public DataSet GetVisitInfo()
        {
            string queryString = "select * from visitInfo";
            return (new DataBase()).GetDataSet(queryString);
        }
    }
}