//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Linq;
//using System.Web;

//namespace Snackster
//{
//    public class Connection
//    {
//        public static string GetConnectionString()
//        {
//            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
//        }
//    }

//    // Checks for valid image extensions
//    public class Utils
//    {
//        public static bool IsValidExtension(string fileName)
//        {
//            bool isValid = false;
//            string[] fileExtension = { ".jpg", ".png", ".jpeg" };
//            for (int i = 0; i <= fileExtension.Length - 1; i++)
//            {
//                if (fileName.Contains(fileExtension[i]))
//                {
//                    isValid = true;
//                    break;
//                }
//            }
//            return isValid;
//        }
//    }
//}