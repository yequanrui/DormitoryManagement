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
///Health 的摘要说明
/// </summary>
namespace StudentApartment.BusinessLogicLayer
{
    public class Health
    {
        private string apartmentNo;   //公寓号
        private string roomNo;        //房间号
        private DateTime healthTime;  //检查时间
        private string healthCheck;   //检查结果
        private string healthScore;   //检查得分
        private string errMessage;　  //错误信息

        //各个字段对应的属性
        #region MyRegion
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
        public DateTime HealthTime
        {
            set
            {
                this.healthTime = value;
            }
            get
            {
                return this.healthTime;
            }
        }
        public string HealthCheck
        {
            set
            {
                this.healthCheck = value;
            }
            get
            {
                return this.healthCheck;
            }
        }
        public string HealthScore
        {
            set
            {
                this.healthScore = value;
            }
            get
            {
                return this.healthScore;
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

        public Health()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }

        public bool InsertHealthInfo()
        {
            //首先检查操作员输入的房间信息是否存在
            string queryString = "select * from roomInfo where apartmentNo=" + SqlString.GetQuotedString(apartmentNo);
            queryString += "and roomNo=" + SqlString.GetQuotedString(roomNo);
            DataBase db = new DataBase();
            if (false == db.GetRecord(queryString))
            {
                this.ErrMessage = "你输入被访人信息不存在！";
                return false;
            }
            //通过了验证后进行来访登记
            string insertString = "insert into healthInfo(apartmentNo,roomNo,healthTime,healthCheck,healthScore) values (";
            insertString += SqlString.GetQuotedString(this.apartmentNo) + ",";
            insertString += SqlString.GetQuotedString(this.roomNo) + ",";
            insertString += SqlString.GetQuotedString(this.healthTime.ToString("yyyy-MM-dd HH:mm:ss")) + ",";
            insertString += SqlString.GetQuotedString(this.healthCheck) + ",";
            insertString += SqlString.GetQuotedString(this.healthScore) + ")";
            if (db.InsertOrUpdate(insertString) > 0)
            {
                this.ErrMessage = "<font color=red>卫生检查信息登记成功!</font>";
                return true;
            }
            else
            {
                this.ErrMessage = "<font color=red>登记卫生检查信息时发生了错误!</font>";
                return false;
            }
        }

        public DataSet GetHealthInfo()
        {
            string queryString = "select * from healthInfo";
            return (new DataBase()).GetDataSet(queryString);
        }
    }
}