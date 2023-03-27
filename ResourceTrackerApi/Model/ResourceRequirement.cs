namespace ResourceTrackerApi.Model
{
    public class ResourceRequirement
    {
        public int Id { get; set; }
        public int Requirement { get; set; }
        public int TrackId { get; set; }
        public string ProjectId { get; set; } = string.Empty;
        public string CreatedDate { get; set; } =string.Empty;
    }
}
