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
/// Student 的摘要说明
/// </summary>
/// 
namespace StudentApartment.BusinessLogicLayer
{
    //此类负责操作与学生信息相关的业务
    public class Student
    {
        private string studentNumber;  //学生学号
        private string studentName;    //学生姓名
        private string studentSex;     //学生性别
        private string studentState;   //政治面貌
        private string collegeName;    //学生系别
        private string studentSpec;    //学生专业
        private DateTime studentBirthday; //出生日期
        private string studentTelephone;  //学生手机号码
        private string studentAddress; //学生家庭地址
        private string studentMemo;    //学生备注
        private string errMessage;     //保存错误信息

        //此代码段是关于字段的属性
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

        public string StudentSex
        {
            set
            {
                this.studentSex = value;
            }
            get
            {
                return this.studentSex;
            }
        }

        public string StudentState
        {
            set
            {
                this.studentState = value;
            }
            get
            {
                return this.studentState;
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

        public string StudentSpec
        {
            set
            {
                this.studentSpec = value;
            }
            get
            {
                return this.studentSpec;
            }
        }

        public DateTime StudentBirthday
        {
            set
            {
                this.studentBirthday = value;
            }
            get
            {
                return this.studentBirthday;
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

        public string StudentAddress
        {
            set
            {
                this.studentAddress = value;
            }
            get
            {
                return this.studentAddress;
            }
        }

        public string StudentMemo
        {
            set
            {
                this.studentMemo = value;
            }
            get
            {
                return this.studentMemo;
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

        public Student()
        {

        }

        //向数据库中加入新的学生信息,成功返回true
        public bool InsertStudent()
        {
            if (IsExist())
                return false; //如果该学号的学生已经存在则返回添加失败
            string insertString = "insert into studentInfo(studentNumber,studentName,studentSex,";
            insertString += "studentState,collegeName,studentSpec,studentBirthday,";
            insertString += "studentTelephone,studentAddress,studentMemo) values (";
            insertString += SqlString.GetQuotedString(this.studentNumber) + ",";
            insertString += SqlString.GetQuotedString(this.studentName) + ",";
            insertString += SqlString.GetQuotedString(this.studentSex) + ",";
            insertString += SqlString.GetQuotedString(this.studentState) + ",";
            insertString += SqlString.GetQuotedString(this.collegeName) + ",";
            insertString += SqlString.GetQuotedString(this.studentSpec) + ",";
            insertString += SqlString.GetQuotedString(this.studentBirthday.ToString("yyyy-MM-dd")) + ",";
            insertString += SqlString.GetQuotedString(this.studentTelephone) + ",";
            insertString += SqlString.GetQuotedString(this.studentAddress) + ",";
            insertString += SqlString.GetQuotedString(this.studentMemo) + ")";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(insertString) > 0)
            {
                this.ErrMessage = "<font color=red>学生信息添加成功!</font>";
                return true;
            }
            else
            {
                this.ErrMessage = "<font color=red>添加学生信息时发生了错误!</font>";
                return false;
            }
        }

        //此函数判断在系统中根据学号判断该学生是否已经存在
        public bool IsExist()
        {
            bool isExist = true;
            string queryString = "select * from studentInfo where studentNumber=" + SqlString.GetQuotedString(studentNumber);
            DataBase db = new DataBase();
            if (false == db.GetRecord(queryString))
                isExist = false;
            else
                this.ErrMessage = "<font color=red>该学生已经存在</font>";
            return isExist;  
        }

        //根据要删除的学生的学号集合对学生信息执行删除操作
        public bool DeleteStudents(string studentNumbers)
        {
            //查询这些学生的住宿信息表,如果学生还有住宿信息不可删除
            string studentLiveInfoString = "select count(*) from liveInfo where studentNumber in (" + studentNumbers + ")";
            DataBase db = new DataBase();
            int liveCount = db.GetRecordCount(studentLiveInfoString);
            if (liveCount > 0) //如果某些学生还存在住宿信息，则不运行删除学生的信息
            {
                this.ErrMessage = "某些学生还存在住宿信息,请将他们退出公寓房间后再执行本操作!";
                return false;
            }
            //查询这些学生的交费信息表，如果还存在交费信息，则不可删除
            string studentMoneyInfoString = "select count(*) from moneyInfo where studentNumber in(" + studentNumbers + ")";
            int moneyInfoCount = db.GetRecordCount(studentMoneyInfoString);
            if(moneyInfoCount > 0) //如果某些学生还存在交费信息，则不运行删除学生的信息
            {
                this.ErrMessage = "系统中还存在某些学生的交费信息，请删除后再执行本操作!";
                return false;
            }
            //下面可以开始执行学生信息的删除
            string deleteStudentString = "delete from studentInfo where studentNumber in (" + studentNumbers + ")";
            int effectCount = db.InsertOrUpdate(deleteStudentString); //返回受影响的记录行数
            if(effectCount<0)
            {
                this.errMessage = "删除学生信息时发生了错误!";
                return false;
            }
            this.errMessage = "删除学生信息成功!";
            return true;
        }

        //根据学号将该学生的信息加载到本类的字段中
        public void LoadStudentInfo(string studentNumber)
        {
            string queryString = "select * from studentInfo where studentNumber = " + SqlString.GetQuotedString(studentNumber);
            DataBase db = new DataBase();
            DataSet studentDs = db.GetDataSet(queryString); //得到该学生对应的信息保存在studentDs内存数据集中
            if (studentDs != null)
            {
                //下面从数据库查询到的各个字段信息填充到本类的相应字段中
                studentNumber = studentDs.Tables[0].Rows[0]["studentNumber"].ToString();
                studentName = studentDs.Tables[0].Rows[0]["studentName"].ToString();
                studentSex = studentDs.Tables[0].Rows[0]["studentSex"].ToString();
                studentState = studentDs.Tables[0].Rows[0]["studentState"].ToString();
                collegeName = studentDs.Tables[0].Rows[0]["collegeName"].ToString();
                studentSpec = studentDs.Tables[0].Rows[0]["studentSpec"].ToString();
                studentBirthday = DateTime.Parse(studentDs.Tables[0].Rows[0]["studentBirthday"].ToString());
                studentTelephone = studentDs.Tables[0].Rows[0]["studentTelephone"].ToString();
                studentAddress = studentDs.Tables[0].Rows[0]["studentAddress"].ToString();
                studentMemo = studentDs.Tables[0].Rows[0]["studentMemo"].ToString();
            }
        }

        //根据学号信息更新学生信息
        public bool UpdateStudetnInfo()
        {
            string updateString = "update studentInfo set studentName = " + SqlString.GetQuotedString(this.studentName);
            updateString += ",studentSex=" + SqlString.GetQuotedString(this.studentSex);
            updateString += ",studentState=" + SqlString.GetQuotedString(this.studentState);
            updateString += ",collegeName=" + SqlString.GetQuotedString(this.collegeName);
            updateString += ",studentSpec=" + SqlString.GetQuotedString(this.studentSpec);
            updateString += ",studentBirthday=" + SqlString.GetQuotedString(this.studentBirthday.ToString("yyyy-MM-dd"));
            updateString += ",studentTelephone=" + SqlString.GetQuotedString(this.studentTelephone);
            updateString += ",studentAddress=" + SqlString.GetQuotedString(this.studentAddress);
            updateString += ",studentMemo=" + SqlString.GetQuotedString(this.studentMemo);
            updateString += " where studentNumber=" + SqlString.GetQuotedString(this.studentNumber);
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) > 0) return true;
            return false;
        }

        //根据查询条件查询学生的信息并且返回DataSet数据集
        public DataSet QueryStudent(string studentNumber, string studentName, string studentSpec)
        {
            string queryString = "select * from studentInfo where studentNumber like '%" + studentNumber + "%'";
            queryString = queryString + " and studentName like '%" + studentName + "%'";
            queryString = queryString + " and studentSpec like '%" + studentSpec + "%'";
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds;
        }

        //查询所有的学生信息
        public DataSet QueryAllStudent()
        {
            string queryString = "select * from studentInfo";
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds;
        }

        //查询所有专业信息
        public DataSet QuerySpecInfo()
        {
            string queryString = "select distinct specialFieldName from collegespecInfo";
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds;
        }
    }
}
