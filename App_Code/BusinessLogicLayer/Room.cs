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
/// Room 的摘要说明
/// </summary>
/// 
namespace StudentApartment.BusinessLogicLayer
{
    //此类负责进行处理与房间信息相关的业务
    public class Room
    {
        private string roomNo;        //房间号
        private string apartmentNo;   //公寓号
        private string roomType;      //房间类型
        private float roomPrice;      //房间月租
        private int numberOfBed;      //房间总床位数
        private int leftNumberOfBed;  //房间剩余床位数;
        private string roomTelephone; //房间电话
        private string roomMemo;      //房间备注
        private string errMessage;    //保存错误信息

        //下面是各个字段对应的属性
        #region MyRegion
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
        public string RoomType
        {
            set
            {
                this.roomType = value;
            }
            get
            {
                return this.roomType;
            }
        }
        public float RoomPrice
        {
            set
            {
                this.roomPrice = value;
            }
            get
            {
                return this.roomPrice;
            }
        }
        public int NumberOfBed
        {
            set
            {
                this.numberOfBed = value;
            }
            get
            {
                return this.numberOfBed;
            }
        }
        public int LeftNumberOfBed
        {
            set
            {
                this.leftNumberOfBed = value;
            }
            get
            {
                return this.leftNumberOfBed;
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
        public string RoomMemo
        {
            set
            {
                this.roomMemo = value;
            }
            get
            {
                return this.roomMemo;
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
        
        public Room()
        {
 
        }

        //将房间信息加入到数据库中
        public bool InsertRoomInfo()
        {
            if(this.IsExistRoomNo()) return false; //该房间已经存在时
            if (this.leftNumberOfBed > this.numberOfBed)
            {
                this.errMessage = "你输入的剩余床位数不能大于总的床位数!";
                return false;
            }
            string insertString = "insert into roomInfo(roomNo,apartmentNo,roomType,roomPrice,numberOfBed,leftNumberOfBed,roomTelephone,roomMemo) values (";
            insertString = insertString + SqlString.GetQuotedString(this.roomNo) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.apartmentNo) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.roomType) + ",";
            insertString = insertString + roomPrice + ",";
            insertString = insertString + this.numberOfBed + ",";
            insertString = insertString + this.leftNumberOfBed + ",";
            insertString = insertString + SqlString.GetQuotedString(this.roomTelephone) + ",";
            insertString = insertString + SqlString.GetQuotedString(this.roomMemo) + ")";
            DataBase db = new DataBase();
            if(db.InsertOrUpdate(insertString)< 0)
            {
                this.ErrMessage = "添加房间信息时发生了错误!";
                return false;
            }
            return true;
        }

        //判断数据库中是否存在该房间编号的房间信息
        public bool IsExistRoomNo()
        {
            bool isExist = true;
            string queryString = "select * from roomInfo where roomNo=" + SqlString.GetQuotedString(this.roomNo);
            DataBase db = new DataBase();
            if (false == db.GetRecord(queryString))
                isExist = false;
            else
                this.ErrMessage = "该房间编号已经存在！";
            return isExist;  
        }

        //查询所有的房间信息
        public DataSet GetAllRoom()
        {
            string queryString = "select * from roomInfo";
            return (new DataBase()).GetDataSet(queryString);
        }

        //查询所有房间类型信息
        public DataSet QueryTypeInfo()
        {
            string queryString = "select distinct roomType from roomInfo";
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds;
        }

        //根据查询条件搜索房间信息
        public DataSet QueryRoomInfo(string roomNo, string apartmentNo, string roomType)
        {
            string queryString = "select * from roomInfo where roomNo like '%" + roomNo + "%'";
            queryString = queryString + " and apartmentNo like '%" + apartmentNo + "%'";
            queryString = queryString + " and roomType like '%" + roomType + "%'";
            return (new DataBase()).GetDataSet(queryString);
        }

        //删除房间信息
        public bool DeleteRooms(string roomNos)
        {
            string queryString = "select count(*) from liveInfo where roomNo in (" + roomNos + ")";
            DataBase db = new DataBase();
            if (db.GetRecordCount(queryString) > 0)
            {
                this.errMessage = "待删除的房间内有学生居住，不能执行此操作!";
                return false;
            }
            string deleteString = "delete from roomInfo where roomNo in (" + roomNos + ")";
            if (db.InsertOrUpdate(deleteString) < 0)
            {
                this.errMessage = "执行删除操作时发生了错误!";
                return false;
            }
            return true;
        }

        //根据房间编号从数据库中取得房间信息并填充到对应字段中
        public void GetRoomInfo(string roomNo)
        {
            DataBase db = new DataBase();
            string queryString = "select * from roomInfo where roomNo=" + SqlString.GetQuotedString(roomNo);
            DataSet ds = db.GetDataSet(queryString);
            this.roomNo = roomNo;
            this.apartmentNo = ds.Tables[0].Rows[0]["apartmentNo"].ToString();
            this.roomType = ds.Tables[0].Rows[0]["roomType"].ToString();
            this.roomPrice = Convert.ToSingle(ds.Tables[0].Rows[0]["roomPrice"].ToString());
            this.numberOfBed = Convert.ToInt16(ds.Tables[0].Rows[0]["numberOfBed"].ToString());
            this.leftNumberOfBed = Convert.ToInt16(ds.Tables[0].Rows[0]["leftNumberOfBed"].ToString());
            this.roomTelephone = ds.Tables[0].Rows[0]["roomTelephone"].ToString();
            this.roomMemo = ds.Tables[0].Rows[0]["roomMemo"].ToString();
        }

        //更新房间信息，被更新的房间编号存在本类的字段中
        public bool UpdateRoomInfo(string roomType, float roomPrice, string roomTelephone, string roomMemo)
        {
            string updateString = "update roomInfo set roomType=" + SqlString.GetQuotedString(roomType);
            updateString += ",roomPrice=" + roomPrice;
            updateString += ",roomTelephone=" + SqlString.GetQuotedString(roomTelephone);
            updateString += ",roomMemo=" + SqlString.GetQuotedString(roomMemo);
            updateString += " where roomNo=" + SqlString.GetQuotedString(this.roomNo);
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) < 0)
            {
                this.errMessage = "执行删除操作时发生了错误!";
                return false;
            }
            return true;
        }

        //根据房间编号得到该房间的剩余床位
        public int GetLeftNumberOfBed(string roomNo)
        {
            string queryString = "select leftNumberOfBed from roomInfo where roomNo="
                + SqlString.GetQuotedString(roomNo);
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return Convert.ToInt16(ds.Tables[0].Rows[0]["leftNumberOfBed"]);
            }
            return 0;
        }
    }
}
