using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using StudentApartment.DataAccessHelper;
using StudentApartment.DataAccessLayer;

/// <summary>
///Apartment 的摘要说明
/// </summary>
namespace StudentApartment.BusinessLogicLayer
{
    //此类负责进行处理与房间信息相关的业务
    public class Apartment
    {
        private string apartmentNo;        //公寓号
        private string apartmentType;      //公寓类型
        private string managerName;        //公寓管理员姓名
        private string managerSex;         //公寓管理员性别
        private string managerState;       //公寓管理员政治面貌
        private string managerTelephone;   //公寓管理员手机号码
        private string managerMemo;        //公寓管理员附加信息
        private string apartmentTelephone; //公寓电话
        private string apartmentMemo;      //公寓备注
        private string errMessage;         //保存错误信息

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
        public string ApartmentType
        {
            set
            {
                this.apartmentType = value;
            }
            get
            {
                return this.apartmentType;
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
        public string ManagerSex
        {
            set
            {
                this.managerSex = value;
            }
            get
            {
                return this.managerSex;
            }
        }
        public string ManagerState
        {
            set
            {
                this.managerState = value;
            }
            get
            {
                return this.managerState;
            }
        }
        public string ManagerTelephone
        {
            set
            {
                this.managerTelephone = value;
            }
            get
            {
                return this.managerTelephone;
            }
        }
        public string ManagerMemo
        {
            set
            {
                this.managerMemo = value;
            }
            get
            {
                return this.managerMemo;
            }
        }
        public string ApartmentTelephone
        {
            set
            {
                this.apartmentTelephone = value;
            }
            get
            {
                return this.apartmentTelephone;
            }
        }
        public string ApartmentMemo
        {
            set
            {
                this.apartmentMemo = value;
            }
            get
            {
                return this.apartmentMemo;
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

        public Apartment()
        {

        }

        //判断数据库中是否存在该公寓编号的公寓信息
        public bool IsExistApartmentNo()
        {
            bool isExist = true;
            string queryString = "select * from apartmentInfo where ApartmentNo=" + SqlString.GetQuotedString(this.ApartmentNo);
            DataBase db = new DataBase();
            if (false == db.GetRecord(queryString))
                isExist = false;
            else
                this.ErrMessage = "该公寓编号已经存在！";
            return isExist;
        }

        //将公寓信息加入到数据库中
        public bool InsertApartmentInfo()
        {
            if (this.IsExistApartmentNo()) return false; //该公寓已经存在时
            string insertString = "insert into apartmentInfo(apartmentNo,apartmentType,managerName,apartmentTelephone,apartmentMemo) values (";
            insertString = insertString + SqlString.GetQuotedString(this.apartmentNo) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.apartmentType) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.managerName) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.apartmentTelephone) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.apartmentMemo) + ")";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(insertString) < 0)
            {
                this.ErrMessage = "添加公寓信息时发生了错误!";
                return false;
            }
            return true;
        }

        //查询所有公寓编号信息
        public DataSet QueryNoInfo()
        {
            string queryString = "select apartmentNo from apartmentInfo";
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds;
        }

        //查询所有公寓类型信息
        public DataSet QueryTypeInfo()
        {
            string queryString = "select distinct apartmentType from apartmentInfo";
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds;
        }

        //查询所有的公寓信息
        public DataSet GetAllApartment()
        {
            string queryString = "select * from apartmentView";
            return (new DataBase()).GetDataSet(queryString);
        }

        //根据查询条件搜索公寓信息
        public DataSet QueryApartmentInfo(string apartmentType, string managerName)
        {
            string queryString = "select * from apartmentView where apartmentType like '%" + apartmentType + "%'";
            queryString = queryString + " and managerName like '%" + managerName + "%'";
            return (new DataBase()).GetDataSet(queryString);
        }

        //删除公寓信息
        public bool DeleteApartments(string apartmentNos)
        {
            string queryString = "select count(*) from liveInfo where apartmentNo in (" + apartmentNos + ")";
            DataBase db = new DataBase();
            if (db.GetRecordCount(queryString) > 0)
            {
                this.errMessage = "待删除的公寓内有学生居住，不能执行此操作!";
                return false;
            }
            string deleteString = "delete from apartmentInfo where apartmentNo in (" + apartmentNos + ")";
            if (db.InsertOrUpdate(deleteString) < 0)
            {
                this.errMessage = "执行删除操作时发生了错误!";
                return false;
            }
            return true;
        }

        //根据公寓编号从数据库中取得公寓信息并填充到对应字段中
        public void GetApartmentInfo(string apartmentNo)
        {
            DataBase db = new DataBase();
            string queryString = "select * from apartmentInfo where apartmentNo=" + SqlString.GetQuotedString(apartmentNo);
            DataSet ds = db.GetDataSet(queryString);
            this.apartmentNo = apartmentNo;
            this.apartmentType = ds.Tables[0].Rows[0]["apartmentType"].ToString();
            this.managerName = ds.Tables[0].Rows[0]["managerName"].ToString();
            this.apartmentTelephone = ds.Tables[0].Rows[0]["apartmentTelephone"].ToString();
            this.apartmentMemo = ds.Tables[0].Rows[0]["apartmentMemo"].ToString();
        }

        //更新公寓信息，被更新的公寓编号存在本类的字段中
        public bool UpdateApartmentInfo(string apartmentType, string managerName, string apartmentTelephone, string apartmentMemo)
        {
            string updateString = "update apartmentInfo set apartmentType=" + SqlString.GetQuotedString(apartmentType);
            updateString += ",managerName=" + SqlString.GetQuotedString(managerName);
            updateString += ",apartmentTelephone=" + SqlString.GetQuotedString(apartmentTelephone);
            updateString += ",apartmentMemo=" + SqlString.GetQuotedString(apartmentMemo);
            updateString += " where apartmentNo=" + SqlString.GetQuotedString(this.apartmentNo);
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) < 0)
            {
                this.errMessage = "执行操作时发生了错误!";
                return false;
            }
            return true;
        }

        //此函数判断在系统中根据姓名判断该宿管是否已经存在
        public bool IsExistManagerName()
        {
            bool isExist = true;
            string queryString = "select * from apartmentmanagerInfo where managerName =" + SqlString.GetQuotedString(managerName);
            DataBase db = new DataBase();
            if (false == db.GetRecord(queryString))
                isExist = false;
            else
                this.ErrMessage = "<font color=red>该宿管已经存在</font>";
            return isExist;
        }

        //查询所有公寓管理员信息
        public DataSet QueryNameInfo()
        {
            string queryString = "select managerName from apartmentmanagerInfo";
            DataSet ds2 = (new DataBase()).GetDataSet(queryString);
            return ds2;
        }

        //删除宿管信息
        public bool DeleteApartmentManager(string managerName)
        {
            string queryString = "select * from apartmentView where managerName =" + SqlString.GetQuotedString(managerName);
            DataBase db = new DataBase();
            if (true == db.GetRecord(queryString))
            {
                this.ErrMessage = "待删除的宿管还有在管理的公寓，不能执行此操作!";
                return false;
            }
            string deleteString = "delete from apartmentmanagerInfo where managerName =" + SqlString.GetQuotedString(managerName);
            if (db.InsertOrUpdate(deleteString) < 0)
            {
                this.errMessage = "执行删除操作时发生了错误!";
                return false;
            }
            return true;
        }

        //将宿管信息加入到数据库中
        public bool InsertApartmentManager()
        {
            if (this.IsExistManagerName()) return false; //该宿管已经存在时
            string insertString = "insert into apartmentmanagerInfo(managerName,managerSex,managerState,managerTelephone,managerMemo) values (";
            insertString = insertString + SqlString.GetQuotedString(this.managerName) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.managerSex) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.managerState) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.managerTelephone) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.managerMemo) + ")";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(insertString) < 0)
            {
                this.ErrMessage = "添加宿管信息时发生了错误!";
                return false;
            }
            return true;
        }

        //根据姓名将该宿管的信息加载到本类的字段中
        public void GetApartmentManager(string managerName)
        {
            DataBase db = new DataBase();
            string queryString = "select * from apartmentmanagerInfo where managerName = " + SqlString.GetQuotedString(managerName);
            DataSet ds = db.GetDataSet(queryString);
            this.managerName = managerName;
            this.managerSex = ds.Tables[0].Rows[0]["managerSex"].ToString();
            this.managerState = ds.Tables[0].Rows[0]["managerState"].ToString();
            this.managerTelephone = ds.Tables[0].Rows[0]["managerTelephone"].ToString();
            this.managerMemo = ds.Tables[0].Rows[0]["managerMemo"].ToString();
        }

        //更新宿管信息，被更新的宿管姓名存在本类的字段中
        public bool UpdateApartmentManager(string managerSex, string managerState, string managerTelephone, string managerMemo)
        {
            string updateString = "update apartmentmanagerInfo set managerSex=" + SqlString.GetQuotedString(managerSex);
            updateString += ",managerState=" + SqlString.GetQuotedString(managerState);
            updateString += ",managerTelephone=" + SqlString.GetQuotedString(managerTelephone);
            updateString += ",managerMemo=" + SqlString.GetQuotedString(managerMemo);
            updateString += " where managerName=" + SqlString.GetQuotedString(this.managerName);
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) < 0)
            {
                this.errMessage = "执行操作时发生了错误!";
                return false;
            }
            return true;
        }
    }
}
