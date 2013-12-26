  CCTVViewer allows you to view a number of the CCTVs on New York State roads and 
a few other states.  The CCTVs are displayed as markers on a Google Map and on mouse 
rollover the CCTV image feed pops up.  The CCTV information is retrieved from the 511 
NY Data Feed available at 511ny.org/developer.aspx.  A user name and password is 
required to access the data feed.  The data feed returns an XML document with each CCTV.  
Each CCTV has a number of nodes that describe where it is located and the URL of the image 
feed.
  When the initial page loads, a map is initialized with all of the CCTVs.  If the user 
rolls over a marker an ajax request is submitted to retrieve the URL of the CCTV's image.
This is so the latest image is displayed.  The images aren't updated all the time on the
data feed so they may stay the same for an amount of time. 
  The CCTVs are kept in a database table, cctv.  This table is populated during a migration,
so to setup the database just run rake db:migrate.  There is a rake task that will refresh
the URLs for each CCTV.  The rake task is ran every 11 seconds by a Clockwork worker.  This
isn't entirely working at the moment.  The Clockwork worker seems to work but if you keep
rolling over a CCTV marker the image never updates.  If you refresh the page the image
will update.  
