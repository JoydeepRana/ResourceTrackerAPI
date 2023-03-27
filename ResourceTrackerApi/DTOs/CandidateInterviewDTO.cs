namespace ResourceTrackerApi.DTOs
{
    public class CandidateInterviewDTO
    {
        public int Id { get; set; }
        public byte IsInternal { get; set; }
        public int EmployeeId { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string MobileNumber { get; set; } = string.Empty;
        public int TechTrackId { get; set; }
        //public string Name { get; set; } = string.Empty; //Refers to the Name from Technical
        public string JobTitle { get; set; } = string.Empty;
        public double Grade { get; set; }
        public string BaseLocation { get; set; } = string.Empty;
        public string Skill { get; set; } = string.Empty;
        public double Experience { get; set; }
        public string LWD { get; set; } = string.Empty;
        public int InterviewDetailsId { get; set; } 
        public int ProjectId { get; set; }
        public string InterviewType { get; set; } = string.Empty;
        public string InterviewDate { get; set; } = string.Empty;
        public string Panel { get; set; } = string.Empty;
        public string InterviewStatus { get; set; } = string.Empty; 
        public string Remarks { get; set; } = string.Empty;
        public string CreatedDate { get; set; } = string.Empty;
        public string UpdatedDate { get; set; } = string.Empty;
        public byte isActive { get; set; }
        public string CreatedBy { get; set; } = string.Empty;
        public string UpdatedBy { get; set; } = string.Empty;
        public string UpdateComments { get; set; } = string.Empty;

    }
}
