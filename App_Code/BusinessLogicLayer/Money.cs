using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using StudentApartment.DataAccessHelper;
using StudentApartment.DataAccessLayer;

/// <summary>
/// Money 的摘要说明
/// </summary>
/// 
namespace StudentApartment.BusinessLogicLayer
{
    public class Money
    {
        private int moneyId;
        private string studentNumber;
        private string studentName;
        private string giveMoneyType;
        private int giveMoneyYear;
        private int giveMoneyMonth;
        private int giveMoneyDay;
        private float giveMoney;
        private string errMessage;

        //各个字段对应的属性
        #region MyRegion
        public int MoneyId
        {
            set
            {
                this.moneyId = value;
            }
            get
            {
                return this.moneyId;
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
        public string GiveMoneyType
        {
            set
            {
                this.giveMoneyType = value;
            }
            get
            {
                return this.giveMoneyType;
            }
        }
        public int GiveMoneyYear
        {
            set
            {
                this.giveMoneyYear = value;
            }
            get
            {
                return this.giveMoneyYear;
            }
        }
        public int GiveMoneyMonth
        {
            set
            {
                this.giveMoneyMonth = value;
            }
            get
            {
                return this.giveMoneyMonth;
            }
        }
        public int GiveMoneyDay
        {
            set
            {
                this.giveMoneyDay = value;
            }
            get
            {
                return this.giveMoneyDay;
            }
        }
        public float GiveMoney
        {
            set
            {
                this.giveMoney = value;
            }
            get
            {
                return this.giveMoney;
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

        public Money()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        //判断是否有该学号的学生存在
        public bool IsExistStudent()
        {
            string queryString = "select * from studentInfo where studentNumber=" + SqlString.GetQuotedString(studentNumber);
            DataBase db = new DataBase();
            return db.GetRecord(queryString);
        }

        //下面执行将新的金额信息加入到数据库中
        public bool InsertMoney()
        {
            if (!IsExistStudent())
            {
                this.errMessage = "对不起,你输入的学号不存在!";
                return false;
            }
            string insertString = "insert into moneyInfo(studentNumber,giveMoneyType,giveMoneyYear,giveMoneyMonth,giveMoneyDay,giveMoney) values (";
            insertString += SqlString.GetQuotedString(this.studentNumber) + ",";
            insertString += SqlString.GetQuotedString(this.giveMoneyType) + ",";
            insertString += this.giveMoneyYear + ",";
            insertString += this.giveMoneyMonth + ",";
            insertString += this.giveMoneyDay + ",";
            insertString += this.giveMoney + ")";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(insertString) < 0)
            {
                this.errMessage = "对不起,数据库操作时发生了错误!";
                return false;
            }
            return true;
        }
        
        //根据编号得到该次缴费金额时间
        public string GetMoneyTime(int moneyId)
        {
            string queryString = "select giveMoneyYear,giveMoneyMonth,giveMoneyDay from moneyInfo where moneyId=" + moneyId;
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0) return String.Empty;
            DataRow dr = ds.Tables[0].Rows[0];
            return dr[0] + "年" + dr[1] + "月" + dr[2] + "日";
        }

        //根据某个缴费编号删除该记录
        public bool DeleteMoneyRecord(int moneyId)
        {
            string deleteString = "delete from moneyInfo where moneyId=" + moneyId;
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(deleteString) < 0) return false;
            return true;
        }

        //根据查询条件查询数据库中的缴费信息
        public DataSet QueryMoneyInfo(string studentNumber, string studentName, string giveMoneyType)
        {
            string queryString = "select * from moneyInfoView where studentNumber like '%" + studentNumber + "%'";
            queryString += " and studentName like '%" + studentName + "%'";
            queryString += " and giveMoneyType like '%" + giveMoneyType + "%'";
            DataBase db = new DataBase();
            return db.GetDataSet(queryString);
        }

        //查询所有的缴费信息
        public DataSet GetAllMoney()
        {
            string queryString = "select * from moneyInfoView";
            return (new DataBase()).GetDataSet(queryString);
        }
        
        //根据缴费编号得到缴费详细信息并保存到各个字段中
        public bool GetMoneyInfo(int moneyId)
        {
            string queryString = "select * from moneyInfoView where moneyId=" + moneyId;
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0)
            {
                this.errMessage = "获取交费信息失败！";
                return false;
            }
            DataRow dr = ds.Tables[0].Rows[0];
            moneyId = Convert.ToInt32(dr["moneyId"].ToString());
            studentNumber = dr["studentNumber"].ToString();
            studentName = dr["studentName"].ToString();
            giveMoneyType = dr["giveMoneyType"].ToString();
            giveMoneyYear = Convert.ToInt16(dr["giveMoneyYear"].ToString());
            giveMoneyMonth = Convert.ToInt16(dr["giveMoneyMonth"].ToString());
            giveMoneyDay = Convert.ToInt16(dr["giveMoneyDay"].ToString());
            giveMoney = Convert.ToSingle(dr["giveMoney"].ToString());
            return true;
        }

        //根据交费编号对交费信息进行更新操作
        public bool Update()
        {
            string updateString = "update moneyInfo set studentNumber=" + SqlString.GetQuotedString(this.studentNumber);
            updateString += ",giveMoneyType=" + SqlString.GetQuotedString(this.giveMoneyType);
            updateString += ",giveMoneyYear=" + this.giveMoneyYear;
            updateString += ",giveMoneyMonth=" + this.giveMoneyMonth;
            updateString += ",giveMoneyDay=" + this.giveMoneyDay;
            updateString += ",giveMoney=" + this.giveMoney;
            updateString += " where moneyId=" + this.moneyId;
            Student student = new Student();
            if (!this.IsExistStudent())
            {
                this.errMessage = "该学号的学生不存在!";
                return false;
            }
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) < 0)
            {
                this.errMessage = "数据更新时发生了错误!";
                return false;
            }
            return true;
        }

        //得到未交清住宿费的学生信息列表
        public ArrayList GetShouldGiveMoneyList()
        {
            ArrayList shouldGiveMoneyList = new ArrayList();
            //遍历所有学生进行住宿费用的核对
            string queryString = "select studentNumber from studentInfo";
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string studentNumber = ds.Tables[0].Rows[i]["studentNumber"].ToString();
                float shouldGiveMoney = this.ShouldGiveMoney(studentNumber); //取得该生应当交的费用
                float realGiveMoney = this.RealGiveMoney(studentNumber); //取得该生实际交的费用
                if (shouldGiveMoney > realGiveMoney) //如果费用未交清就加入到列表中
                {
                    Student student = new Student();
                    student.LoadStudentInfo(studentNumber);
                    GiveMoneyInfo giveMoneyInfo = new GiveMoneyInfo();
                    giveMoneyInfo.StudentNumber = studentNumber;
                    giveMoneyInfo.StudentName = student.StudentName;
                    giveMoneyInfo.CollegeName = student.CollegeName;
                    giveMoneyInfo.SpecialFieldName = student.StudentSpec;
                    giveMoneyInfo.LiveInTime = (new Live()).GetLiveTime(studentNumber);
                    giveMoneyInfo.ShouldGiveMoney = shouldGiveMoney;
                    giveMoneyInfo.RealGiveMoney = realGiveMoney;
                    shouldGiveMoneyList.Add(giveMoneyInfo);
                }
            }
            return shouldGiveMoneyList;
        }

        //该学生到现在应该交的住宿费用
        public float ShouldGiveMoney(string studentNumber)
        {
            Live live = new Live();
            string liveInTimeString = live.GetLiveTime(studentNumber); //取得该生入住时间
            float roomPrice = live.GetRoomPrice(studentNumber); //取得入住房间的价格
            DateTime liveInTime = DateTime.Parse(liveInTimeString);
            DateTime nowTime = System.DateTime.Now;
            TimeSpan ts = nowTime - liveInTime; //计算该生居住的时间
            int totalDays = Convert.ToInt32(ts.TotalDays);
            return (roomPrice * totalDays / 30);
        }

        //该学生到现在实际交的住宿费用
        public float RealGiveMoney(string studentNumber)
        {
            string queryString = "select sum(giveMoney) as realGiveMoney from moneyInfo where giveMoneyType='住宿费' and studentNumber=" + SqlString.GetQuotedString(studentNumber);
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            if (ds == null) return 0.0f;
            if (ds.Tables[0].Rows.Count > 0)
            {
                string realGiveMoneyString = ds.Tables[0].Rows[0]["realGiveMoney"].ToString();
                if (realGiveMoneyString == "") return 0.0f;
                return Convert.ToSingle(realGiveMoneyString);
            }
            return 0.0f;
        }
    }
}


