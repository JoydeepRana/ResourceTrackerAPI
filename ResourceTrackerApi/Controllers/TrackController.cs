using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ResourceTrackerApi.Model;
using ResourceTrackerApi.Repository;
using SqlKata.Compilers;
using SqlKata.Execution;
using System.Data.SqlClient;

namespace ResourceTrackerApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TrackController : ControllerBase
    {
        static DBContext _context = new DBContext();
        QueryFactory db = _context.GetQueryFactory();

        [HttpGet]
        public IEnumerable<TechnicalTrack> Get()
        {
            IEnumerable<TechnicalTrack> status = null;
            try
            {
                status = db.Query("TechnicalTrack").Get<TechnicalTrack>();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return status;
        }

        [HttpGet("{id}")]
        public TechnicalTrack GetById(int id)
        {
            TechnicalTrack track = null;
            try
            {
                track = db.Query("TechnicalTrack").Where("Id", id).FirstOrDefault<TechnicalTrack>();
            }
            catch (Exception ex) { return null; }
            return track;
        }

        [HttpPost]
        public int Insert([FromBody] TechnicalTrack track)
        {
            int id;
            if (track.Id == 0) //Insert
            {
                try
                {
                    id = db.Query("TechnicalTrack").InsertGetId<int>(new
                    {
                        name = track.Name,
                        projectId = track.ProjectId
                    });
                }
                catch (Exception ex) { return 0; }
            }
            else  //Update
            {
                int affected = 0;
                try
                {
                    affected = db.Query("TechnicalTrack").Where("Id", track.Id).Update(new
                    {
                        name = track.Name,
                        projectId = track.ProjectId
                    });
                }
                catch (Exception ex) { return 0; }
                return affected;
            }
            return id;
        }
        [HttpDelete("{id}")]
        public int Delete(int id)
        {
            int deleted = 0;
            try
            {
                deleted = db.Query("TechnicalTrack").Where("Id", id).Delete();
            }
            catch (Exception ex) { return 0; }
            return deleted;
        }
    }
}
