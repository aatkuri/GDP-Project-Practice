using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WriteCalEvent
{
    public class OutlookCalendarApi
    {
        public string AccessToken { get; set; }
      
   private const string UrlBase = "https://apis.live.net/v5.0/";
     
   public OutlookCalendarApi()
        {
        }
        
   public OutlookCalendarApi(string accessToken)
        {
            AccessToken = accessToken;
        }
    }
}