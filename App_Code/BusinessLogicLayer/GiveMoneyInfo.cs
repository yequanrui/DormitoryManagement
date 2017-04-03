using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// GiveMoneyList 的摘要说明
/// </summary>
/// 
namespace StudentApartment.BusinessLogicLayer
{
    public class GiveMoneyInfo
    {
        string studentNumber;
        string studentName;
        string collegeName;
        string specialFieldName;
        string liveInTime;
        float shouldGiveMoney;
        float realGiveMoney;

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
        public string CollegeName
        {
            set
            {
                this.collegeName = value;
            }
            get
            {
                return this.collegeName;
            }
        }
        public string SpecialFieldName
        {
            set
            {
                this.specialFieldName = value;
            }
            get
            {
                return this.specialFieldName;
            }
        }
        public string LiveInTime
        {
            set
            {
                this.liveInTime = value;
            }
            get
            {
                return this.liveInTime;
            }
        }
        public float ShouldGiveMoney
        {
            set
            {
                this.shouldGiveMoney = value;
            }
            get
            {
                return this.shouldGiveMoney;
            }
        }
        public float RealGiveMoney
        {
            set
            {
                this.realGiveMoney = value;
            }
            get
            {
                return this.realGiveMoney;
            }
        }

        #endregion

        public GiveMoneyInfo()
        {
            this.studentNumber = "";
            this.studentName = "";
            this.collegeName = "";
            this.specialFieldName = "";
            this.liveInTime = "";
            this.shouldGiveMoney = 0.0f;
            this.realGiveMoney = 0.0f;
        }
    }
}
