-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 217.613770 , 310.856476 , 26.799026 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(197.817,331.731,20.720);]] )
   Camera:MotionSpline_AddSplinePoint( 216.384079 , 311.990295 , 27.190453 , 3.099999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 215.435379 , 312.943329 , 26.160450 , 5.499997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 213.554230 , 314.833008 , 27.180450 , 7.099996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 212.627716 , 315.763733 , 26.210453 , 8.699997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 211.679077 , 316.716705 , 27.330444 , 10.100002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 210.734360 , 317.665710 , 26.520447 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 209.785614 , 318.618774 , 27.810452 , 13.200014 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 208.836914 , 319.571808 , 27.040447 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 207.888214 , 320.524811 , 28.130447 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
