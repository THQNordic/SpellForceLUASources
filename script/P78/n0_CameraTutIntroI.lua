-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 208.738724 , 580.736511 , 59.635448 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(213.977,589.404,59.000);]] )
   Camera:MotionSpline_AddSplinePoint( 202.986588 , 570.805908 , 61.755650 , 6.599996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 199.026367 , 563.968811 , 63.195652 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 193.790085 , 555.721436 , 62.225651 , 0.000000 , [[Camera:ScriptSplineModifyCursorSpeed(0.001);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
