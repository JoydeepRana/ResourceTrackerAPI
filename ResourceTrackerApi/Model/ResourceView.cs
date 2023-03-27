namespace ResourceTrackerApi.Model
{
    public class ResourceView
    {
        public int Id { get; set; }
        public string TrackName { get; set; } = string.Empty;
        public int Requirement { get; set; }
        public int PendingRequirement { get; set; }
        public int FullfillledPositions { get; set; }
        public int CIRejected { get; set; }
        public int CIScheduled { get; set; }
        public int CIBTS { get; set; }
        public int TotalProposed { get; set; }
    }
}
