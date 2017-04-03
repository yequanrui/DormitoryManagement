using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using StudentApartment.DataAccessLayer;
using StudentApartment.DataAccessHelper;

/// <summary>
/// Admin 的摘要说明
/// </summary>
/// 
namespace StudentApartment.BusinessLogicLayer
{
    public class Admin
    {
        private string adminUserName; //登录用户名
        private string adminPassword; //登录密码
        private string adminUserRole; //登录角色
        private string studentNumber; //学生学号
        private string managerName;   //宿管姓名
        private DateTime loginTime;   //登录时间
        private DateTime logoutTime;  //登出时间
        private string errMessage;    //登录失败原因

        #region MyRegion
        public string AdminUserName
        {
            set
            {
                this.adminUserName = value;
            }
            get
            {
                return this.adminUserName;
            }
        }

        public string AdminPassword
        {
            set
            {
                this.adminPassword = value;
            }
            get
            {
                return this.adminPassword;
            }
        }

        public string AdminUserRole
        {
            set
            {
                this.adminUserRole = value;
            }
            get
            {
                return this.adminUserRole;
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

        public DateTime LoginTime
        {
            set
            {
                this.loginTime = value;
            }
            get
            {
                return this.loginTime;
            }
        }

        public DateTime LogoutTime
        {
            set
            {
                this.logoutTime = value;
            }
            get
            {
                return this.logoutTime;
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

        //判断用户的登录管理权限
        public bool checkAdmin() 
        {
            string queryString;
            bool hasUser,isPasswordRight;

            //首先在数据库中查询该管理帐号是否存在
            queryString = "select * from admin where adminUsername = " + SqlString.GetQuotedString(this.adminUserName) +
                " and adminUserrole = " + SqlString.GetQuotedString(this.adminUserRole);
            DataBase db = new DataBase();
            hasUser = db.GetRecord(queryString);
            if (false == hasUser)
            {
                errMessage = "对不起，用户名不存在!";
                return false;
            }

            //再查询数据库该管理帐号的密码是否正确
            queryString = "select * from admin where adminUsername = " + SqlString.GetQuotedString(this.adminUserName);
            queryString += " and adminPassword = " + SqlString.GetQuotedString(this.adminPassword);
            isPasswordRight = db.GetRecord(queryString);
            if (false == isPasswordRight)
            {
                errMessage = "对不起，用户密码错误!";
                return false;
            }
            return true;
        }

        //传递登录信息到登录日志
        public bool Tologin()
        {
            string insertString = "insert into log(adminUserName,adminUserrole,loginTime) values (";
            insertString += SqlString.GetQuotedString(this.adminUserName) + ",";
            insertString += SqlString.GetQuotedString(this.adminUserRole) + ",";
            insertString += SqlString.GetQuotedString(this.loginTime.ToString("yyyy-MM-dd HH:mm:ss")) + ")";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(insertString) < 0)
                return false;
            return true;
        }

        //传递登出信息到登录日志
        public bool Tologout()
        {
            string updateString = "update log set logoutTime=" + SqlString.GetQuotedString(this.logoutTime.ToString("yyyy-MM-dd HH:mm:ss"));
            updateString += " where loginTime=" + SqlString.GetQuotedString(this.loginTime.ToString("yyyy-MM-dd HH:mm:ss"));
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) < 0)
                return false;
            return true;
        }

        //修改登录密码
        public bool ChangePassword()
        {
            string updateString = "update admin set adminPassword=" + SqlString.GetQuotedString(adminPassword);
            updateString += " where adminUserName=" + SqlString.GetQuotedString(adminUserName);
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) < 0)
                return false;
            return true;
        }

        //查询所有的登录信息
        public DataSet GetlogInfo()
        {
            string queryString = "select * from log";
            return (new DataBase()).GetDataSet(queryString);
        }

        //根据登录名查询对应的宿管姓名
        public string GetmanagerName()
        {
            string queryString = "select managerName from adminMView where adminUsername=" + SqlString.GetQuotedString(adminUserName);
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            this.managerName = ds.Tables[0].Rows[0]["managerName"].ToString();
            return managerName;
        }

        //根据登录名查询对应的学生学号
        public string GetstudentNumber()
        {
            string queryString = "select studentNumber from adminSView where adminUsername=" + SqlString.GetQuotedString(adminUserName);
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            this.studentNumber = ds.Tables[0].Rows[0]["studentNumber"].ToString();
            return studentNumber;
        }
    }
}
