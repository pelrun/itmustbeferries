# James Churchill 2016
# For HSBNE.org and GovHack 2016

# Get live ferry data from government data set
# figure out which approaching ferries are picking up passengers for the return journey
# calculate distance and estimated departure time for passing to visualisation

import urllib2
import ujson as json
import time

stop=318002

url = "https://svc.brisbane.qld.gov.au/api/ferry/stop-monitor?monitoringRef=%s" % stop
stops = json.loads(urllib2.urlopen(url).read())

stops = stops['Siri']['ServiceDelivery']['StopMonitoringDelivery']

validuntil = stops['ValidUntil']
visits = stops['MonitoredStopVisit']

#visits = [visits[i:i+1] for i in xrange(0, len(visits), 2)]

for visit in visits:
    visit = visit['MonitoredVehicleJourney']
    print [visit['JourneyPatternRef'], visit['MonitoredCall']['ExpectedDepartureTime'], visit['VehicleLocation']]
#    print visit['MonitoredCall'] #['ExpectedDepartureTime']
 #   print visit['MonitoredVehicleJourney']['JourneyPatternRef']
