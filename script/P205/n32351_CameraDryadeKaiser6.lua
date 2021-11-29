-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 315.411499 , 384.761841 , 16.273582 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(9250);]] )
   Camera:MotionSpline_AddSplinePoint( 318.949310 , 386.322479 , 17.063103 , 7.399995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 318.558044 , 388.257141 , 17.063103 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 318.558044 , 388.257141 , 17.063103 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
