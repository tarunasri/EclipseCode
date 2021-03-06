     )"This data type is a non-negative value."               6"This data type is a non-zero and non-negative value."                                         p"The MIB module to describe Uninterruptible Power
               Supplies. This version is extended for DIOAD."L"        Jeffrey D. Case

                Postal: SNMP Research, Incorporated
                        3001 Kimberlin Heights Road
                        Knoxville, TN  37920
                        US

                   Tel: +1 615 573 1434
                   Fax: +1 615 573 9197

                E-mail: case@snmp.com"                       #"The name of the UPS manufacturer."                       "The UPS Model designation."                       �"The UPS firmware/software version(s).  This variable
               may or may not have the same value as
               upsIdentAgentSoftwareVersion in some implementations."                       �"The UPS agent software version.  This variable may or
               may not have the same value as
               upsIdentUPSSoftwareVersion in some implementations."                       `"A string identifying the UPS.  This object should be
               set by the administrator."                       �"A string identifying the devices attached to the
               output(s) of the UPS.  This object should be set by
               the administrator."                          �"The indication of the capacity remaining in the UPS
               system's batteries.   A value of batteryNormal
               indicates that the remaining run-time is greater than
               upsConfigLowBattTime.  A value of batteryLow indicates
               that the remaining battery run-time is less than or
               equal to upsConfigLowBattTime.  A value of
               batteryDepleted indicates that the UPS will be unable
               to sustain the present load when and if the utility
               power is lost (including the possibility that the
               utility power is currently absent and the UPS is
               unable to sustain the output)."                      8"If the unit is on battery power, the elapsed time
               since the UPS last switched to battery power, or the
               time since the network management subsystem was last
               restarted, whichever is less.  Zero shall be returned
               if the unit is not on battery power."                       �"An estimate of the time to battery charge depletion
               under the present load conditions if the utility power
               is off and remains off, or if it were to be lost and
               remain off."                       d"An estimate of the battery charge remaining expressed
               as a percent of full charge."                       /"The magnitude of the present battery voltage."                       "The present battery current."                       L"The ambient temperature at or near the UPS Battery
               casing."                          @"A count of the number of times the input entered an
               out-of-tolerance condition as defined by the
               manufacturer.  This count is incremented by one each
               time the input transitions from zero out-of-tolerance
               lines to one or more input lines out-of-tolerance."                       �"The number of input lines utilized in this device.
               This variable indicates the number of rows in the
               input table."                       r"A list of input table entries.  The number of entries
               is given by the value of upsInputNumLines."                       X"An entry containing information applicable to a
               particular input line."                       "The input line identifier."                       "The present input frequency."                       -"The magnitude of the present input voltage."                       -"The magnitude of the present input current."                       0"The magnitude of the present input true power."                           �"The present source of output power.  The enumeration
               none(2) indicates that there is no source of output
               power (and therefore no output power), for example,
               the system has opened the output breaker."                       "The present output frequency."                       �"The number of output lines utilized in this device.
               This variable indicates the number of rows in the
               output table."                       t"A list of output table entries.  The number of
               entries is given by the value of upsOutputNumLines."                       Y"An entry containing information applicable to a
               particular output line."                       "The output line identifier."                       "The present output voltage."                       "The present output current."                        "The present output true power."                       �"The percentage of the UPS power capacity presently
               being used on this output line, i.e., the greater of
               the percent load of true power capacity and the
               percent load of VA."                           "The present bypass frequency."                       �"The number of bypass lines utilized in this device.
               This entry indicates the number of rows in the bypass
               table."                       t"A list of bypass table entries.  The number of
               entries is given by the value of upsBypassNumLines."                       Z"An entry containing information applicable to a
               particular bypass input."                       "The bypass line identifier."                       "The present bypass voltage."                       "The present bypass current."                       0"The present true power conveyed by the bypass."                           0"The present number of active alarm conditions."                      W"A list of alarm table entries.  The table contains
               zero, one, or many rows at any moment, depending upon
               the number of alarm conditions in effect.  The table
               is initially empty at agent startup.  The agent
               creates a row in the table each time a condition is
               detected and deletes that row when that condition no
               longer pertains.  The agent creates the first row with
               upsAlarmId equal to 1, and increments the value of
               upsAlarmId each time a new row is created, wrapping to
               the first free value greater than or equal to 1 when
               the maximum value of upsAlarmId would otherwise be
               exceeded.  Consequently, after multiple operations,
               the table may become sparse, e.g., containing entries
               for rows 95, 100, 101, and 203 and the entries should
               not be assumed to be in chronological order because
               upsAlarmId might have wrapped.

               Alarms are named by an AutonomousType (OBJECT
               IDENTIFIER), upsAlarmDescr, to allow a single table to
               reflect well known alarms plus alarms defined by a
               particular implementation, i.e., as documented in the
               private enterprise MIB definition for the device.  No
               two rows will have the same value of upsAlarmDescr,
               since alarms define conditions.  In order to meet this
               requirement, care should be taken in the definition of
               alarm conditions to insure that a system cannot enter
               the same condition multiple times simultaneously.

               The number of rows in the table at any given time is
               reflected by the value of upsAlarmsPresent."                       S"An entry containing information applicable to a
               particular alarm."                       _"A unique identifier for an alarm condition.  This
               value must remain constant."                       �"A reference to an alarm description object.  The
               object referenced should not be accessible, but rather
               be used to provide a unique description of the alarm
               condition."                      "The value of sysUpTime when the alarm condition was
               detected.  If the alarm condition was detected at the
               time of agent startup and presumably existed before
               agent startup, the value of upsAlarmTime shall equal
               0."                           T"One or more batteries have been determined to require
               replacement."               ."The UPS is drawing power from the batteries."               _"The remaining battery run-time is less than or equal
               to upsConfigLowBattTime."               k"The UPS will be unable to sustain the present load
               when and if the utility power is lost."               $"A temperature is out of tolerance."               )"An input condition is out of tolerance."               V"An output condition (other than OutputOverload) is
               out of tolerance."               2"The output load exceeds the UPS output capacity."               -"The Bypass is presently engaged on the UPS."               !"The Bypass is out of tolerance."               M"The UPS has shutdown as requested, i.e., the output
               is off."               +"The entire UPS has shutdown as commanded."               \"An uncorrected problem has been detected within the
               UPS charger subsystem."               ,"The output of the UPS is in the off state."               %"The UPS system is in the off state."               O"The failure of one or more fans in the UPS has been
               detected."               5"The failure of one or more fuses has been detected."               /"A general fault in the UPS has been detected."               M"The result of the last diagnostic test indicates a
               failure."               e"A problem has been encountered in the communications
               between the agent and the UPS."               Z"The UPS output is off and the UPS is awaiting the
               return of input power."               0"A upsShutdownAfterDelay countdown is underway."               �"The UPS will turn off power to the load in less than
               5 seconds; this may be either a timed shutdown or a
               low battery shutdown."              �"A test is in progress, as initiated and indicated by
               the Test Group.  Tests initiated via other
               implementation-specific mechanisms can indicate the
               presence of the testing in the alarm table, if
               desired, via a OBJECT-IDENTITY macro in the MIB
               document specific to that implementation and are
               outside the scope of this OBJECT-IDENTITY."               "Alarm AUX Input 1."               "Alarm AUX Input 2."               "Alarm AUX Input 3."               "Alarm AUX Input 4."               $"Alarm SiteManager Digital Input 1."               $"Alarm SiteManager Digital Input 2."               $"Alarm SiteManager Digital Input 3."               $"Alarm SiteManager Digital Input 4."               $"Alarm SiteManager Digital Input 5."               $"Alarm SiteManager Digital Input 6."               $"Alarm SiteManager Digital Input 7."               $"Alarm SiteManager Digital Input 8."               #"Alarm SiteManager Analog Input 1."               #"Alarm SiteManager Analog Input 2."               #"Alarm SiteManager Analog Input 3."               #"Alarm SiteManager Analog Input 4."               #"Alarm SiteManager Analog Input 5."               #"Alarm SiteManager Analog Input 6."               #"Alarm SiteManager Analog Input 7."               #"Alarm SiteManager Analog Input 8."               "Alarm SiteManager Marker 1."               "Alarm SiteManager Marker 2."               "Alarm SiteManager Marker 3."               "Alarm SiteManager Marker 4."               "Alarm SiteManager Marker 5."               "Alarm SiteManager Marker 6."               "Alarm SiteManager Marker 7."               "Alarm SiteManager Marker 8."               "Alarm SiteManager Output 1."               "Alarm SiteManager Output 2."               "Alarm SiteManager Output 3."               "Alarm SiteManager Output 4."               "Alarm SiteManager Output 5."               "Alarm SiteManager Output 6."               "Alarm SiteManager Output 7."               "Alarm SiteManager Output 8."               "Alarm SiteMonitor 1."               "Alarm SiteMonitor 2."               "Alarm SiteMonitor 3."               "Alarm SiteMonitor 4."               "Alarm SiteMonitor 5."               "Alarm SiteMonitor 6."               "Alarm SiteMonitor 7."               "Alarm SiteMonitor 8."               "Alarm SiteMonitor 9."               "Alarm SiteMonitor 10."               "Alarm SiteMonitor 11."               "Alarm SiteMonitor 12."               "Alarm SiteMonitor 13."               "Alarm SiteMonitor 14."               "Alarm SiteMonitor 15."               "Alarm SiteMonitor 16."               "Alarm SiteMonitor 17."               "Alarm SiteMonitor 18."               "Alarm SiteMonitor 19."               "Alarm SiteMonitor 20."               "Alarm SiteMonitor 21."               "Alarm SiteMonitor 22."               "Alarm SiteMonitor 23."               "Alarm SiteMonitor 24."               "Alarm SiteMonitor 25."               "Alarm SiteMonitor 26."               "Alarm SiteMonitor 27."               "Alarm SiteMonitor 28."               "Alarm SiteMonitor 29."               "Alarm SiteMonitor 30."               "Alarm SiteMonitor 31."               "Alarm SiteMonitor 32."               "Alarm SiteMonitor 33."               "Alarm SiteMonitor 34."               "Alarm SiteMonitor 35."               "Alarm SiteMonitor 36."               "Alarm SiteMonitor 37."               "Alarm SiteMonitor 38."               "Alarm SiteMonitor 39."               "Alarm SiteMonitor 40."               "Alarm SiteMonitor 41."               "Alarm SiteMonitor 42."               "Alarm SiteMonitor 43."               "Alarm SiteMonitor 44."               "Alarm SiteMonitor 45."               "Alarm SiteMonitor 46."               "Alarm SiteMonitor 47."               "Alarm SiteMonitor 48."               "Alarm SiteMonitor 49."               "Alarm SiteMonitor 50."               "Alarm SiteMonitor 51."               "Alarm SiteMonitor 52."               "Alarm SiteMonitor 53."               "Alarm SiteMonitor 54."               "Alarm SiteMonitor 55."               "Alarm SiteMonitor 56."               "Alarm SiteMonitor 57."               "Alarm SiteMonitor 58."               "Alarm SiteMonitor 59."               "Alarm SiteMonitor 60."               "Alarm SiteMonitor 61."               "Alarm SiteMonitor 62."               "Alarm SiteMonitor 63."               "Alarm SiteMonitor 64."               7"Alarm SensorManager sensor 1 lower threshold reached."               7"Alarm SensorManager sensor 2 lower threshold reached."               7"Alarm SensorManager sensor 3 lower threshold reached."               7"Alarm SensorManager sensor 4 lower threshold reached."               7"Alarm SensorManager sensor 5 lower threshold reached."               7"Alarm SensorManager sensor 6 lower threshold reached."               7"Alarm SensorManager sensor 7 lower threshold reached."               7"Alarm SensorManager sensor 8 lower threshold reached."               7"Alarm SensorManager sensor 1 upper threshold reached."               7"Alarm SensorManager sensor 2 upper threshold reached."               7"Alarm SensorManager sensor 3 upper threshold reached."               7"Alarm SensorManager sensor 4 upper threshold reached."               7"Alarm SensorManager sensor 5 upper threshold reached."               7"Alarm SensorManager sensor 6 upper threshold reached."               7"Alarm SensorManager sensor 7 upper threshold reached."               7"alarm SensorManager sensor 8 upper threshold reached."               "User defined alarm."               "User defined alarm 2."               "User defined alarm 3."               "User defined alarm 4."               "User defined alarm 5."               "User defined alarm 6."               "User defined alarm 7."               "Discharging"               
"Charging"               )"Alarm SensorManager input 1 not normal."               )"Alarm SensorManager input 2 not normal."               )"Alarm SensorManager input 3 not normal."               )"Alarm SensorManager input 4 not normal."               *"Alarm SensorManager output 1 not normal."               *"Alarm SensorManager output 2 not normal."               *"Alarm SensorManager output 3 not normal."               *"Alarm SensorManager output 4 not normal."               )"Alarm SensorManager communication lost."               "Antennenmast Windalarm."               ""The Sources are not synchronous."               3"The failure of static Switch A has been detected."               3"The failure of static Switch B has been detected."               +"The static Switch A is presently engaged."               +"The static Switch B is presently engaged."               +"The manual Bypass A is presently engaged."               +"The manual Bypass B is presently engaged."               3"The failure of static Source A has been detected."               3"The failure of static Source B has been detected."               $"A general fault has been detected."               1"Unable to switch to the alternate power source."               ."The output load exceeds the output capacity."               J"Black Box ready. This signals that history files are ready for download."                  ~"The test is named by an OBJECT IDENTIFIER which
               allows a standard mechanism for the initiation of
               tests, including the well known tests identified in
               this document as well as those introduced by a
               particular implementation, i.e., as documented in the
               private enterprise MIB definition for the device.

               Setting this variable initiates the named test. Sets
               to this variable require the presence of
               upsTestSpinLock in the same SNMP message.

               The set request will be rejected with an appropriate
               error message if the requested test cannot be
               performed, including attempts to start a test when
               another test is already in progress.  The status of
               the current or last test is maintained in
               upsTestResultsSummary. Tests in progress may be
               aborted by setting the upsTestId variable to
               upsTestAbortTestInProgress.

               Read operations return the value of the name of the
               test in progress if a test is in progress or the name
               of the last test performed if no test is in progress,
               unless no test has been run, in which case the well
               known value upsTestNoTestsInitiated is returned."                      u"A spin lock on the test subsystem.  The spinlock is
               used as follows.

               Before starting a test, a manager-station should make
               sure that a test is not in progress as follows:

                   try_again:
                     get (upsTestSpinLock)
                     while (upsTestResultsSummary == inProgress) {
                       /* loop while a test is running for another
               manager */
                       short delay
                       get (upsTestSpinLock)
                     }
                     lock_value = upsTestSpinLock
                     /* no test in progress, start the test */
                     set (upsTestSpinLock = lock_value, upsTestId =
               requested_test)
                     if (error_index == 1) { /* (upsTestSpinLock
               failed) */
                       /* if problem is not access control, then
                           some other manager slipped in ahead of us
               */
                       goto try_again
                     }
                     if (error_index == 2) { /* (upsTestId) */
                       /* cannot perform the test */
                       give up
                     }
                     /* test started ok */
                     /* wait for test completion by polling
               upsTestResultsSummary */
                     get (upsTestSpinLock, upsTestResultsSummary,
               upsTestResultsDetail)
                     while (upsTestResultsSummary == inProgress) {
                       short delay
                       get (upsTestSpinLock, upsTestResultsSummary,
               upsTestResultsDetail)
                     }
                     /* when test completes, retrieve any additional
               test results */
                     /* if upsTestSpinLock == lock_value + 1, then
               these are our test */
                     /* results (as opposed to another manager's */
                     The initial value of upsTestSpinLock at agent
               initialization shall
                     be 1."                      �"The results of the current or last UPS diagnostics
               test performed.  The values for donePass(1),
               doneWarning(2), and doneError(3) indicate that the
               test completed either successfully, with a warning, or
               with an error, respectively.  The value aborted(4) is
               returned for tests which are aborted by setting the
               value of upsTestId to upsTestAbortTestInProgress.
               Tests which have not yet concluded are indicated by
               inProgress(5).  The value noTestsInitiated(6)
               indicates that no previous test results are available,
               such as is the case when no tests have been run since
               the last reinitialization of the network management
               subsystem and the system has no provision for non-
               volatile storage of test results."                       �"Additional information about upsTestResultsSummary.
               If no additional information available, a zero length
               string is returned."                      2"The value of sysUpTime at the time the test in
               progress was initiated, or, if no test is in progress,
               the time the previous test was initiated.  If the
               value of upsTestResultsSummary is noTestsInitiated(6),
               upsTestStartTime has the value 0."                      3"The amount of time, in TimeTicks, since the test in
               progress was initiated, or, if no test is in progress,
               the previous test took to complete.  If the value of
               upsTestResultsSummary is noTestsInitiated(6),
               upsTestElapsedTime has the value 0."                           J"No tests have been initiated and no test is in
               progress."               ["The test in progress is to be aborted / the test in
               progress was aborted."               I"The manufacturer's standard test of UPS device
               systems."               Z"A test that is sufficient to determine if the battery
               needs replacement."              �"The system is placed on battery to a discharge level,
               set by the manufacturer, sufficient to determine
               battery replacement and battery run-time with a high
               degree of confidence.  WARNING:  this test will leave
               the battery in a low charge state and will require
               time for recharging to a level sufficient to provide
               normal battery duration for the protected load."                  "This object determines the nature of the action to be
               taken at the time when the countdown of the
               upsShutdownAfterDelay and upsRebootWithDuration
               objects reaches zero.

               Setting this object to output(1) indicates that
               shutdown requests should cause only the output of the
               UPS to turn off.  Setting this object to system(2)
               indicates that shutdown requests will cause the entire
               UPS system to turn off."                      >"Setting this object will shutdown (i.e., turn off)
               either the UPS output or the UPS system (as determined
               by the value of upsShutdownType at the time of
               shutdown) after the indicated number of seconds, or
               less if the UPS batteries become depleted. Setting
               this object to 0 will cause the shutdown to occur
               immediately.  Setting this object to -1 will abort the
               countdown.  If the system is already in the desired
               state at the time the countdown reaches 0, then
               nothing will happen.  That is, there is no additional
               action at that time if upsShutdownType = system and
               the system is already off.  Similarly, there is no
               additional action at that time if upsShutdownType =
               output and the output is already off.  When read,
               upsShutdownAfterDelay will return the number of
               seconds remaining until shutdown, or -1 if no shutdown
               countdown is in effect.  On some systems, if the agent
               is restarted while a shutdown countdown is in effect,
               the countdown may be aborted.  Sets to this object
               override any upsShutdownAfterDelay already in effect."                      4"Setting this object will start the output after the
               indicated number of seconds, including starting the
               UPS, if necessary.  Setting this object to 0 will
               cause the startup to occur immediately.  Setting this
               object to -1 will abort the countdown.  If the output
               is already on at the time the countdown reaches 0,
               then nothing will happen.  Sets to this object
               override the effect of any upsStartupAfterDelay
               countdown or upsRebootWithDuration countdown in
               progress.  When read, upsStartupAfterDelay will return
               the number of seconds until startup, or -1 if no
               startup countdown is in effect.  If the countdown
               expires during a utility failure, the startup shall
               not occur until the utility power is restored.  On
               some systems, if the agent is restarted while a
               startup countdown is in effect, the countdown is
               aborted."                      R"Setting this object will immediately shutdown (i.e.,
               turn off) either the UPS output or the UPS system (as
               determined by the value of upsShutdownType at the time
               of shutdown) for a period equal to the indicated
               number of seconds, after which time the output will be
               started, including starting the UPS, if necessary.  If
               the number of seconds required to perform the request
               is greater than the requested duration, then the
               requested shutdown and startup cycle shall be
               performed in the minimum time possible, but in no case
               shall this require more than the requested duration
               plus 60 seconds.  When read, upsRebootWithDuration
               shall return the number of seconds remaining in the
               countdown, or -1 if no countdown is in progress.  If
               the startup should occur during a utility failure, the
               startup shall not occur until the utility power is
               restored."                      w"Setting this object to 'on' will cause the UPS system
               to restart after a shutdown if the shutdown occurred
               during a power loss as a result of either a
               upsShutdownAfterDelay or an internal battery depleted
               condition.  Setting this object to 'off' will prevent
               the UPS system from restarting after a shutdown until
               an operator manually or remotely explicitly restarts
               it.  If the UPS is in a startup or reboot countdown,
               then the UPS will not restart until that delay has
               been satisfied."                          �"The magnitude of the nominal input voltage.  On those
               systems which support read-write access to this
               object, if there is an attempt to set this variable to
               a value that is not supported, the request must be
               rejected and the agent shall respond with an
               appropriate error message, i.e., badValue for SNMPv1,
               or inconsistentValue for SNMPv2."                      �"The nominal input frequency.  On those systems which
               support read-write access to this object, if there is
               an attempt to set this variable to a value that is not
               supported, the request must be rejected and the agent
               shall respond with an appropriate error message, i.e.,
               badValue for SNMPv1, or inconsistentValue for SNMPv2."                      �"The magnitude of the nominal output voltage.  On
               those systems which support read-write access to this
               object, if there is an attempt to set this variable to
               a value that is not supported, the request must be
               rejected and the agent shall respond with an
               appropriate error message, i.e., badValue for SNMPv1,
               or inconsistentValue for SNMPv2."                      �"The nominal output frequency.  On those systems which
               support read-write access to this object, if there is
               an attempt to set this variable to a value that is not
               supported, the request must be rejected and the agent
               shall respond with an appropriate error message, i.e.,
               badValue for SNMPv1, or inconsistentValue for SNMPv2."                       /"The magnitude of the nominal Volt-Amp rating."                       1"The magnitude of the nominal true power rating."                      �"The value of upsEstimatedMinutesRemaining at which a
               lowBattery condition is declared.  For agents which
               support only discrete (discontinuous) values, then the
               agent shall round up to the next supported value.  If
               the requested value is larger than the largest
               supported value, then the largest supported value
               shall be selected."                      �"The requested state of the audible alarm.  When in
               the disabled state, the audible alarm should never
               sound.  The enabled state is self-describing.  Setting
               this object to muted(3) when the audible alarm is
               sounding shall temporarily silence the alarm.  It will
               remain muted until it would normally stop sounding and
               the value returned for read operations during this
               period shall equal muted(3).  At the end of this
               period, the value shall revert to enabled(2).  Writes
               of the value muted(3) when the audible alarm is not
               sounding shall be accepted but otherwise shall have no
               effect."                       k"The minimum input line voltage allowed before the UPS
               system transfers to battery backup."                       e"The maximum line voltage allowed before the UPS
               system transfers to battery backup."                               
"Relais 1"                       
"Relais 2"                       
"Relais 3"                       
"Relais 4"                       
"Relais 5"                       
"Relais 6"                       
"Relais 7"                       
"Relais 8"                           "Digital 1"                       "Digital 2"                       "Digital 3"                       "Digital 4"                       "Digital 5"                       "Digital 6"                       "Digital 7"                       "Digital 8"                           
"Analog 1"                       "Analog 1 Minimum"                       "Analog 1 Maximum"                       
"Analog 2"                       "Analog 2 Minimum"                       "Analog 2 Maximum"                       
"Analog 3"                       "Analog 3 Minimum"                       "Analog 3 Maximum"                       
"Analog 4"                       "Analog 4 Minimum"                       "Analog 4 Maximum"                       
"Analog 5"                       "Analog 5 Minimum"                       "Analog 5 Maximum"                       
"Analog 6"                       "Analog 6 Minimum"                       "Analog 6 Maximum"                       
"Analog 7"                       "Analog 7 Minimum"                       "Analog 7 Maximum"                       
"Analog 8"                       "Analog 8 Minimum"                       "Analog 8 Maximum"                           
"Marker 1"                       
"Marker 2"                       
"Marker 3"                       
"Marker 4"                       
"Marker 5"                       
"Marker 6"                       
"Marker 7"                       
"Marker 8"                           "SiteMonitor 1"                       "SiteMonitor 2"                       "SiteMonitor 3"                       "SiteMonitor 4"                       "SiteMonitor 5"                       "SiteMonitor 6"                       "SiteMonitor 7"                       "SiteMonitor 8"                       "SiteMonitor 9"                       "SiteMonitor 10"                       "SiteMonitor 11"                       "SiteMonitor 12"                       "SiteMonitor 13"                       "SiteMonitor 14"                       "SiteMonitor 15"                       "SiteMonitor 16"                       "SiteMonitor 17"                       "SiteMonitor 18"                       "SiteMonitor 19"                       "SiteMonitor 20"                       "SiteMonitor 21"                       "SiteMonitor 22"                       "SiteMonitor 23"                       "SiteMonitor 24"                       "SiteMonitor 25"                       "SiteMonitor 26"                       "SiteMonitor 27"                       "SiteMonitor 28"                       "SiteMonitor 29"                       "SiteMonitor 30"                       "SiteMonitor 31"                       "SiteMonitor 32"                       "SiteMonitor 33"                       "SiteMonitor 34"                       "siteMonitor 35"                       "SiteMonitor 36"                       "SiteMonitor 37"                       "SiteMonitor 38"                       "SiteMonitor 39"                       "SiteMonitor 40"                       "SiteMonitor 41"                       "SiteMonitor 42"                       "SiteMonitor 43"                       "SiteMonitor 44"                       "SiteMonitor 45"                       "SiteMonitor 46"                       "SiteMonitor 47"                       "SiteMonitor 48"                       "SiteMonitor 49"                       "SiteMonitor 50"                       "SiteMonitor 51"                       "SiteMonitor 52"                       "SiteMonitor 53"                       "SiteMonitor 54"                       "SiteMonitor 55"                       "SiteMonitor 56"                       "SiteMonitor 57"                       "SiteMonitor 58"                       "SiteMonitor 59"                       "SiteMonitor 60"                       "SiteMonitor 61"                       "SiteMonitor 62"                       "SiteMonitor 63"                       "SiteMonitor 64"                           "AUX-Port 1"                       "AUX-Port 2"                       "AUX-Port 3"                       "AUX-Port 4"                               "SensorMan Value 1"                       "SensorMan Location 1"                       "SensorMan Unit 1"                       "SensorMan Lower Threshold 1"                       "SensorMan Upper Threshold 1"                       "SensorMan Scaling Factor 1"                       "SensorMan Offset 1"                           "SensorMan Value 2"                       "SensorMan Location 2"                       "SensorMan Unit 2"                       "SensorMan Lower Threshold 2"                       "SensorMan Upper Threshold 2"                       "SensorMan Scaling Factor 2"                       "SensorMan Offset 2"                           "SensorMan Value 3"                       "SensorMan Location 3"                       "SensorMan Unit 3"                       "SensorMan Lower Threshold 3"                       "SensorMan Upper Threshold 3"                       "SensorMan Scaling Factor 3"                       "SensorMan Offset 3"                           "SensorMan Value 4"                       "SensorMan Location 4"                       "SensorMan Unit 4"                       "SensorMan Lower Threshold 4"                       "SensorMan Upper Threshold 4"                       "SensorMan Scaling Factor 4"                       "SensorMan Offset 4"                           "SensorMan Value 5"                       "SensorMan Location 5"                       "SensorMan Unit 5"                       "SensorMan Lower Threshold 5"                       "SensorMan Upper Threshold 5"                       "SensorMan Scaling Factor 5"                       "SensorMan Offset 5"                           "SensorMan Value 6"                       "SensorMan Location 6"                       "SensorMan Unit 6"                       "SensorMan Lower Threshold 6"                       "SensorMan Upper Threshold 6"                       "SensorMan Scaling Factor 6"                       "SensorMan Offset 6"                           "SensorMan Value 7"                       "SensorMan Location 7"                       "SensorMan Unit 7"                       "SensorMan Lower Threshold 7"                       "SensorMan Upper Threshold 7"                       "SensorMan Scaling Factor 7"                       "SensorMan Offset 7"                           "SensorMan Value 8"                       "SensorMan Location 8"                       "SensorMan Unit 8"                       "SensorMan Lower Threshold 8"                       "SensorMan Upper Threshold 8"                       "SensorMan Scaling Factor 8"                       "SensorMan Offset 8"                           "SensorMan Input 1"                       "SensorMan Input 1 Location"                       )"SensorMan Input 1 is used as NC contact"                           "SensorMan Input 2"                       "SensorMan Input 2 Location"                       )"SensorMan Input 2 is used as NC contact"                           "SensorMan Input 3"                       "SensorMan Input 3 Location"                       )"SensorMan Input 3 is used as NC contact"                           "SensorMan Input 4"                       "SensorMan Input 4 Location"                       )"SensorMan Input 4 is used as NC contact"                           "SensorMan Output 1"                       "SensorMan Output 1 Location"                       *"SensorMan Output 1 is used as NC contact"                           "SensorMan Output 2"                       "SensorMan Output 2 Location"                       *"SensorMan Output 2 is used as NC contact"                           "SensorMan Output 3"                       "SensorMan Output 3 Location"                       *"SensorMan Output 3 is used as NC contact"                           "SensorMan Output 4"                       "SensorMan Output 4 Location"                       *"SensorMan Output 4 is used as NC contact"                           "Static switch 1 on"                       "Static switch 2 on"                       "Manual Bypass 1 On"                       "Manual Bypass 2 On"                       "Auto Transfermode"                       "Sources Synchron"                       "Prefered Mains 1"                       "Prefered Mains 2"                       "Autostart Enabled"                           �"The UPS is operating on battery power.  This trap is
               persistent and is resent at one minute intervals until
               the UPS either turns off or is no longer running on
               battery."                 M"This trap is sent upon completion of a UPS diagnostic
               test."                 �"This trap is sent each time an alarm is inserted into
               to the alarm table.  It is sent on the insertion of
               all alarms except for upsAlarmOnBattery and
               upsAlarmTestInProgress."                 �"This trap is sent each time an alarm is removed from
               the alarm table.  It is sent on the removal of all
               alarms except for upsAlarmTestInProgress."                         m"The compliance statement for UPSs that only support
               the two-contact communication protocol."   Z"Support of the values unknown(1) and
               batteryDepleted(4) is not required."4"Support of all `well known' alarm types is not
               required.  The well known alarm types which must be
               supported are: upsAlarmOnBattery, upsAlarmLowBattery,
               upsAlarmInputBad, upsAlarmUpsOutputOff,
               upsAlarmUpsSystemOff, and upsAlarmTestInProgress." p"Support of the values other(1), none(2), bypass(4),
               booster(6) and reducer(7) is not required." z"Read-write access is not required, i.e., compliant
               systems need not support more than one shutdown type." y"Read-write access is not required, i.e., compliant
               systems need not support more than one restart type." $"Read-write access is not required." $"Read-write access is not required." $"Read-write access is not required." $"Read-write access is not required."             j"The compliance statement for UPSs that support
               full-featured functions, such as control."  �"Support of all `well known' alarm types is not
               required.  The well known alarm types which must be
               supported are: upsAlarmOnBattery, upsAlarmLowBattery,
               upsAlarmDepletedBattery, upsAlarmTempBad,
               upsAlarmInputBad, upsAlarmOutputOverload,
               upsAlarmOnBypass, upsAlarmBypassBad,
               upsAlarmOutputOffAsRequested,
               upsAlarmUpsOffAsRequested, upsAlarmUpsOutputOff,
               upsAlarmUpsSystemOff, upsAlarmGeneralFault,
               upsAlarmDiagnosticTestFailed,
               upsAlarmCommunicationsLost, upsAlarmShutdownPending,
               and upsAlarmTestInProgress." �"Support of all `well known' test types is not
               required.  If no tests are supported, then the only
               well known test type which must be supported is
               upsTestNoTestsInitiated." p"Support of the values other(1), none(2), bypass(4),
               booster(6) and reducer(7) is not required." _"The upsBasicBypassGroup is only required for UPSs
               that have a Bypass present." z"Read-write access is not required, i.e., compliant
               systems need not support more than one shutdown type." y"Read-write access is not required, i.e., compliant
               systems need not support more than one restart type." $"Read-write access is not required." $"Read-write access is not required." $"Read-write access is not required." $"Read-write access is not required.""Implementation of all possible values may be onerous
               for some systems.  Consequently, not all possible
               values must be supported.  However, at least two
               different manufacturer-selected values must be
               supported."             b"The compliance statement for UPSs that support
               advanced full-featured functions."  �"Support of all `well known' alarm types is not
               required.  The well known alarm types which must be
               supported are: upsAlarmBatteryBad, upsAlarmOnBattery,
               upsAlarmLowBattery, upsAlarmDepletedBattery,
               upsAlarmTempBad, upsAlarmInputBad, upsAlarmOnBypass,
               upsAlarmBypassBad, upsAlarmOutputOffAsRequested,
               upsAlarmUpsOffAsRequested, upsAlarmUpsOutputOff,
               upsAlarmUpsSystemOff, upsAlarmGeneralFault,
               upsAlarmDiagnosticTestFailed,
               upsAlarmCommunicationsLost, upsAlarmShutdownPending,
               and upsAlarmTestInProgress.""Support of all `well known' test types is not
               required.  The well known test types which must be
               supported are: upsTestNoTestsInitiated,
               upsTestGeneralSystemsTest, and
               upsTestQuickBatteryTest." p"Support of the values other(1), none(2), bypass(4),
               booster(6) and reducer(7) is not required." ^"The upsFullBypassGroup is only required for UPSs that
               have a Bypass present." z"Read-write access is not required, i.e., compliant
               systems need not support more than one shutdown type." y"Read-write access is not required, i.e., compliant
               systems need not support more than one restart type." $"Read-write access is not required." $"Read-write access is not required." $"Read-write access is not required." $"Read-write access is not required.""Implementation of all possible values may be onerous
               for some systems.  Consequently, not all possible
               values must be supported.  However, at least two
               different manufacturer-selected values must be
               supported."                    M"The upsSubsetIdentGroup defines objects which are
               common across all UPSs which meet subset compliance.
               Most devices which conform to the upsSubsetIdentGroup
               will provide access to these objects via a proxy
               agent.  If the proxy agent is compatible with multiple
               UPS types, configuration of the proxy agent will
               require specifying some of these values, either
               individually, or as a group (perhaps through a table
               lookup mechanism based on the UPS model number)."                 v"The upsSubsetBatteryGroup defines the objects that
               are common to battery groups of two-contact UPSs."                 v"The upsSubsetInputGroup defines the objects that are
               common to the Input groups of two-contact UPSs."                 x"The upsSubsetOutputGroup defines the objects that are
               common to the Output groups of two-contact UPSs."                 v"The upsSubsetAlarmGroup defines the objects that are
               common to the Alarm groups of two-contact UPSs."                 z"The upsSubsetControlGroup defines the objects that
               are common to the Control groups of two-contact UPSs."                 x"The upsSubsetConfigGroup defines the objects that are
               common to the Config groups of two-contact UPSs."                     �"The upsBasicIdentGroup defines objects which are
               common to the Ident group of compliant UPSs which
               support basic functions."                 �"The upsBasicBatteryGroup defines the objects that are
               common to the battery groups of compliant UPSs which
               support basic functions."                 �"The upsBasicInputGroup defines the objects that are
               common to the Input groups of compliant UPSs which
               support basic functions."                 �"The upsBasicOutputGroup defines the objects that are
               common to the Output groups of compliant UPSs which
               support basic functions."                 �"The upsBasicBypassGroup defines the objects that are
               common to the Bypass groups of compliant UPSs which
               support basic functions."                 �"The upsBasicAlarmGroup defines the objects that are
               common to the Alarm  groups of compliant UPSs which
               support basic functions."                 �"The upsBasicTestGroup defines the objects that are
               common to the Test groups of compliant UPSs which
               support basic functions."                 �"The upsBasicControlGroup defines the objects that are
               common to the Control groups of compliant UPSs which
               support basic functions."                 �"The upsBasicConfigGroup defines the objects that are
               common to the Config groups of UPSs which support
               basic functions."                     t"The upsFullIdentGroup defines objects which are
               common to the Ident group of fully compliant UPSs."                 |"The upsFullBatteryGroup defines the objects that are
               common to the battery groups of fully compliant UPSs."                 x"The upsFullInputGroup defines the objects that are
               common to the Input groups of fully compliant UPSs."                 z"The upsFullOutputGroup defines the objects that are
               common to the Output groups of fully compliant UPSs."                 z"The upsFullBypassGroup defines the objects that are
               common to the Bypass groups of fully compliant UPSs."                 y"The upsFullAlarmGroup defines the objects that are
               common to the Alarm  groups of fully compliant UPSs."                 v"The upsFullTestGroup defines the objects that are
               common to the Test groups of fully compliant UPSs."                 p"The upsFullControlGroup defines the objects that are
   common to the Control groups of fully compliant UPSs."                 z"The upsFullConfigGroup defines the objects that are
               common to the Config groups of fully compliant UPSs."                    