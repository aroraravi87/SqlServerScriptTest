--select * from sys.spatial_reference_systems

DECLARE @MeterPerMile FLOAT =1609.34

DECLARE @LocStart GEOGRAPHY=GEOGRAPHY::Point(28.6139,77.2090,4326)

DECLARE @LocEnd GEOGRAPHY=GEOGRAPHY::Point(28.4089123,77.3177894,4326)

SELECT @LocStart.STDistance(@LocEnd)/@MeterPerMile [Distance];
