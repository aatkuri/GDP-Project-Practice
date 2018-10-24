using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OfficeHoursDataAccess
{
    public class OutlookEvent
    {
        public string id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public DateTime start_time { get; set; }
        public DateTime end_time { get; set; }
    }
}
