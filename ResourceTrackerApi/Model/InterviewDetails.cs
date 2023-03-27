namespace ResourceTrackerApi.Model
{
    public class InterviewDetails
    {
        public int Id { get; set; }
        public int ProjectId { get; set; }
        public string InterviewType { get; set; }=string.Empty;
        public string InterviewDate { get; set; } = string.Empty;
        public string Panel { get; set; } = string.Empty;
        public string InterviewStatus { get; set; } = string.Empty;
        public string Remarks { get; set; } = string.Empty;
        public string CreatedBy { get; set; } = string.Empty;
        public string CreatedDate { get; set; } = string.Empty;
        public string UpdatedBy { get; set; } = string.Empty;
        public string UpdatedDate { get; set; } = string.Empty;
        public string UpdateComments { get; set; } = string.Empty;

    }
}
