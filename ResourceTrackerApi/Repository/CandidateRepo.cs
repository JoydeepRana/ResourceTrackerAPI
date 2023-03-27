using ResourceTrackerApi.Model;
using SqlKata.Compilers;
using SqlKata.Execution;
using System.Data.SqlClient;

namespace ResourceTrackerApi.Repository
{
    public class CandidateRepo
    {
        static DBContext _context = new DBContext();
        QueryFactory db = _context.GetQueryFactory();
        public int InsertGetId(Candidate candidate)
        {
            int id = 0;
            try
            {
                id = db.Query("Candidate").InsertGetId<int>(new
                {
                    isInternal = candidate.IsInternal,
                    employeeId = candidate.EmployeeId,
                    firstName = candidate.FirstName,
                    lastname = candidate.LastName,
                    email = candidate.Email,
                    mobileNumber = candidate.MobileNumber,
                    techTrackId = candidate.TechTrackId,
                    jobTitle = candidate.JobTitle,
                    grade = candidate.Grade,
                    baseLocation = candidate.BaseLocation,
                    skill = candidate.Skill,
                    experience = candidate.Experience,
                    LWD = candidate.LWD,
                    interviewDetailsId = candidate.InterviewDetailsId,
                    createdBy = candidate.CreatedBy
                });
            }
            catch (Exception ex) { return 0; }
            return id;
        }

        public int UpdateGetAffected(Candidate candidate) 
        {
            int affectedrowsCandidate = 0;
            try
            {
                affectedrowsCandidate = db.Query("Candidate").Where("Id", candidate.Id).Update(new
                {
                    isInternal = candidate.IsInternal,
                    employeeId = candidate.EmployeeId,
                    firstName = candidate.FirstName,
                    lastname = candidate.LastName,
                    email = candidate.Email,
                    mobileNumber = candidate.MobileNumber,
                    techTrackId = candidate.TechTrackId,
                    jobTitle = candidate.JobTitle,
                    grade = candidate.Grade,
                    baseLocation = candidate.BaseLocation,
                    skill = candidate.Skill,
                    experience = candidate.Experience,
                    LWD = candidate.LWD,
                    interviewDetailsId = candidate.InterviewDetailsId,
                    updatedDate = candidate.UpdatedDate,
                    updatedBy = candidate.UpdatedBy,
                    updateComments = candidate.UpdateComments
                });
            }
            catch (Exception ex) { return 0; }
            return affectedrowsCandidate;
        }

        public int Delete(int Id)
        {
            int deleted = 0;
            try
            {
                deleted = db.Query("Candidate").Where("Id", Id).Delete();
            }
            catch (Exception ex) { return 0; }
            return deleted;
        }

        public Candidate GetById(int id)
        {
            Candidate candidate= null;
            try
            {
                candidate = db.Query("Candidate").Where("Id", id).FirstOrDefault<Candidate>();
            }
            catch (Exception ex) { return null; }
            return candidate;
        }
    }
}
