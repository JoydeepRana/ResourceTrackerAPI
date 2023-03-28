namespace ResourceTrackerApi.Model
{
    public class ResourceRequirement
    {
        public int Id { get; set; }
        public int Requirement { get; set; }
        public int TrackId { get; set; }
        public int ProjectId { get; set; }
        public string CreatedDate { get; set; } =string.Empty;
    }
}
