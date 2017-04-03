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
///Appraisal 的摘要说明
/// </summary>
namespace StudentApartment.BusinessLogicLayer
{
    public class Appraisal
    {
        private string apartmentNo;     //公寓号
        private string roomNo;          //房间号
        private string appraisalYear;   //评比学年
        private string appraisalTerm;   //评比学期
        private string basicScoreH;     //卫生基础分
        private string totalScoreH;     //卫生得分
        private string healthScale;     //卫生比例
        private string basicScoreI;     //违规基础分
        private string totalScoreI;     //违规扣分
        private string illegalScale;    //违规比例
        private string appraisalScore;  //评比分数
        private string appraisalGrade;  //评比排名
        private string appraisalAward;  //评比称号
        private DateTime appraisalTime; //评比时间
        private string errMessage;      //保存错误信息

        //下面是各个字段对应的属性
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
                return this.roomNo;
            }
        }
        public string AppraisalYear
        {
            set
            {
                this.appraisalYear = value;
            }
            get
            {
                return this.appraisalYear;
            }
        }
        public string AppraisalTerm
        {
            set
            {
                this.appraisalTerm = value;
            }
            get
            {
                return this.appraisalTerm;
            }
        }
        public string BasicScoreH
        {
            set
            {
                this.basicScoreH = value;
            }
            get
            {
                return this.basicScoreH;
            }
        }
        public string TotalScoreH
        {
            set
            {
                this.totalScoreH = value;
            }
            get
            {
                return this.totalScoreH;
            }
        }
        public string HealthScale
        {
            set
            {
                this.healthScale = value;
            }
            get
            {
                return this.healthScale;
            }
        }
        public string BasicScoreI
        {
            set
            {
                this.basicScoreI = value;
            }
            get
            {
                return this.basicScoreI;
            }
        }
        public string TotalScoreI
        {
            set
            {
                this.totalScoreI = value;
            }
            get
            {
                return this.totalScoreI;
            }
        }
        public string IllegalScale
        {
            set
            {
                this.illegalScale = value;
            }
            get
            {
                return this.illegalScale;
            }
        }
        public string AppraisalScore
        {
            set
            {
                this.appraisalScore = value;
            }
            get
            {
                return this.appraisalScore;
            }
        }
        public string AppraisalGrade
        {
            set
            {
                this.appraisalGrade = value;
            }
            get
            {
                return this.appraisalGrade;
            }
        }
        public string AppraisalAward
        {
            set
            {
                this.appraisalAward = value;
            }
            get
            {
                return this.appraisalAward;
            }
        }
        public DateTime AppraisalTime
        {
            set
            {
                this.appraisalTime = value;
            }
            get
            {
                return this.appraisalTime;
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

        public Appraisal()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }

        //添加参加评比的宿舍
        public bool AddAppraisalRoom()
        {
            string insertString = "insert into appraisalInfo(apartmentNo,roomNo) select apartmentNo,roomNo from roomInfo";
            DataBase db = new DataBase();
            int count = db.InsertOrUpdate(insertString);
            for (int i = 1; i < count; i++)
            {
                string updateString = "update appraisalInfo set appraisalYear=" + SqlString.GetQuotedString(appraisalYear);
                updateString += ", appraisalTerm=" + SqlString.GetQuotedString(appraisalTerm);
                updateString += "where appraisalYear is null and appraisalTerm is null";
                if (db.InsertOrUpdate(updateString) > 0)
                {
                    this.ErrMessage = "<font color=red>评比宿舍添加成功!</font>";
                    return true;
                }
                else
                {
                    this.ErrMessage = "<font color=red>添加评比宿舍时发生了错误!</font>";
                    return false;
                }
            }
            return true;
        }

        //此函数判断在系统中根据学号判断该学生是否已经存在
        public bool IsExist()
        {
            bool isExist = true;
            string queryString = "select * from appraisalSet where appraisalYear=" + SqlString.GetQuotedString(appraisalYear);
            queryString += "and appraisalTerm=" + SqlString.GetQuotedString(appraisalTerm);
            DataBase db = new DataBase();
            if (false == db.GetRecord(queryString))
                isExist = false;
            else
                this.ErrMessage = "该学年学期的公式已经设定！";
            return isExist;
        }

        //添加评分计算公式的各项数值
        public bool AddAppraisalCalc()
        {
            if (IsExist()) return false;
            string insertString = "insert into appraisalSet(appraisalYear,appraisalTerm,";
            insertString += "basicScoreH,healthScale,basicScoreI,illegalScale) values (";
            insertString += SqlString.GetQuotedString(appraisalYear) + ",";
            insertString += SqlString.GetQuotedString(appraisalTerm) + ",";
            insertString += SqlString.GetQuotedString(basicScoreH) + ",";
            insertString += SqlString.GetQuotedString(healthScale) + ",";
            insertString += SqlString.GetQuotedString(basicScoreI) + ",";
            insertString += SqlString.GetQuotedString(illegalScale) + ")";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(insertString) < 0)
            {
                this.errMessage = "添加计算公式时发生了错误!";
                return false;
            }
            return true;
        }

        //查询所有的评比信息
        public DataSet GetAllAppraisal()
        {
            string queryString = "select * from appraisalInfo";
            return (new DataBase()).GetDataSet(queryString);
        }

        //查询所有的学年信息
        public DataSet GetAppraisalYear()
        {
            string queryString = "select distinct appraisalYear from appraisalSet";
            return (new DataBase()).GetDataSet(queryString);
        }

        //查询所有的学期信息
        public DataSet GetAppraisalTerm()
        {
            string queryString = "select distinct appraisalTerm from appraisalSet";
            return (new DataBase()).GetDataSet(queryString);
        }

        //根据查询条件搜索评比设置信息
        public DataSet QueryAppraisalSet(string appraisalYear, string appraisalTerm)
        {
            string queryString = "select * from appraisalSet where appraisalYear=" + SqlString.GetQuotedString(appraisalYear);
            queryString += " and appraisalTerm=" + SqlString.GetQuotedString(appraisalTerm);
            return (new DataBase()).GetDataSet(queryString);
        }

        //根据查询条件搜索卫生总得分
        public string QueryTotalScoreH(string appraisalYear)
        {
            DataBase db = new DataBase();
            string sumstring = "select sum(healthScore) from healthInfo,appraisalInfo";
            sumstring += " where healthInfo.apartmentNo=appraisalInfo.apartmentNo and healthInfo.roomNo=appraisalInfo.roomNo";
            sumstring += " and ((Year(healthInfo.healthTime)=" + SqlString.GetQuotedString(appraisalYear);
            sumstring += " and Month(healthInfo.healthTime) between 9 and 12)";
            sumstring += " or (Year(healthInfo.healthTime)=" + SqlString.GetQuotedString(appraisalYear);
            sumstring += "+1 and Month(healthInfo.healthTime) between 3 and 6))";
            this.totalScoreH = db.GetRecordCount(sumstring).ToString();
            return totalScoreH;
        }

        //根据查询条件搜索违规总扣分
        public string QueryTotalScoreI(string appraisalYear)
        {
            DataBase db = new DataBase();
            string sumstring = "select sum(illegalScore) from illegalInfo,appraisalInfo";
            sumstring += " where illegalInfo.apartmentNo=appraisalInfo.apartmentNo and illegalInfo.roomNo=appraisalInfo.roomNo";
            sumstring += " and ((Year(illegalInfo.illegalTime) = " + SqlString.GetQuotedString(appraisalYear);
            sumstring += " and Month(illegalInfo.illegalTime) between 9 and 12)";
            sumstring += " or (Year(illegalInfo.illegalTime) = " + SqlString.GetQuotedString(appraisalYear);
            sumstring += "+1 and Month(illegalInfo.illegalTime) between 3 and 6))";
            this.totalScoreI = db.GetRecordCount(sumstring).ToString();
            return totalScoreI;
        }

        //根据查询条件搜索评比结果信息
        public DataSet QueryAppraisalInfo(string apartmentNo, string appraisalYear, string appraisalTerm)
        {
            string queryString = "select * from appraisalInfo where apartmentNo like '%" + apartmentNo + "%'";
            queryString += " and appraisalYear like '%" + appraisalYear + "%'";
            queryString += " and appraisalTerm like '%" + appraisalTerm + "%'";
            return (new DataBase()).GetDataSet(queryString);
        }

        //更新计算公式
        public bool UpdateCalc()
        {
            string updateString = "update appraisalSet set basicScoreH=" + SqlString.GetQuotedString(this.basicScoreH);
            updateString += ",healthScale=" + SqlString.GetQuotedString(this.healthScale);
            updateString += ",basicScoreI=" + SqlString.GetQuotedString(this.basicScoreI);
            updateString += ",illegalScale=" + SqlString.GetQuotedString(this.illegalScale);
            updateString += " where appraisalYear=" + SqlString.GetQuotedString(this.appraisalYear);
            updateString += " and appraisalTerm=" + SqlString.GetQuotedString(this.appraisalTerm);
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) > 0) return true;
            return false;
        }

        //根据计算公式计算评分
        public bool CalcAppraisalScore()
        {
            string calcString = "update appraisalView set appraisalScore=((basicScoreH+" + SqlString.GetQuotedString(this.totalScoreH);
            calcString += ")*healthScale)+((basicScoreI-" + SqlString.GetQuotedString(this.totalScoreI);
            calcString += ")*illegalScale)";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(calcString) < 0)
            {
                this.errMessage = "更新计算时发生了错误!";
                return false;
            }
            string queryString = "select * from appraisalView where appraisalYear=" + SqlString.GetQuotedString(appraisalYear);
            queryString += " and appraisalTerm=" + SqlString.GetQuotedString(appraisalTerm);
            DataSet ds = db.GetDataSet(queryString);
            DataRow dr = ds.Tables[0].Rows[0];
            if (dr["appraisalScore"] == null)
            {
                string calcString1 = "update appraisalView set appraisalScore=basicScoreH*healthScale+basicScoreI*illegalScale";
                if (db.InsertOrUpdate(calcString1) < 0)
                {
                    this.errMessage = "更新计算时发生了错误!";
                    return false;
                }
            }
            return true;
        }

        //根据评分对宿舍进行先分组后排名
        //public bool CalcAppraisalGrade()
        //{
        //    string calcString = "select * from appraisalInfo group by apartmentNo order by appraisalScore";
        //    DataBase db = new DataBase();
        //    if (db.InsertOrUpdate(calcString) < 0)
        //    {
        //        this.errMessage = "排名时发生了错误!";
        //        return false;
        //    }
        //    return true;
        //}

        //根据公寓号和排名获取相关评分数据
        public void LoadAppraisalInfo(string apartmentNo, string appraisalGrade)
        {
            string queryString = "select * from appraisalInfo where apartmentNo = " + SqlString.GetQuotedString(apartmentNo);
            queryString += " and appraisalGrade = " + SqlString.GetQuotedString(appraisalGrade);
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            DataRow dr = ds.Tables[0].Rows[0];
            //下面从数据库查询到的各个字段信息填充到本类的相应字段中
            this.apartmentNo = dr["apartmentNo"].ToString();
            this.roomNo = dr["roomNo"].ToString();
            this.appraisalYear = dr["appraisalYear"].ToString();
            this.appraisalTerm = dr["appraisalTerm"].ToString();
            this.appraisalGrade = dr["appraisalGrade"].ToString();
            this.appraisalAward = dr["appraisalAward"].ToString();
            this.appraisalTime = DateTime.Parse(dr["appraisalTime"].ToString());
        }
    }
}