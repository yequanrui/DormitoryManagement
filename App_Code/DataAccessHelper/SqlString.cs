using System;
using System.Collections;

namespace StudentApartment.DataAccessHelper
{
    public class SqlString
    {
        //公有静态方法，将SQL字符串里面的(')转换成('')
        public static String GetSafeSqlString(String XStr)
        {
            return XStr.Replace("'", "''");
        }

        //公有静态方法，将SQL字符串里面的(')转换成('')，再在字符串的两边加上(')
        public static String GetQuotedString(String XStr)
        {
            return ("'" + GetSafeSqlString(XStr) + "'");
        }
    }

}