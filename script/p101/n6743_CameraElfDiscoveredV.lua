-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 553.678711 , 212.423355 , 14.712074 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(553.204,214.104,-50.000);]] )
   Camera:MotionSpline_AddSplinePoint( 554.901917 , 206.181076 , 14.712074 , 11.500008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 555.118225 , 198.433517 , 14.712074 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 558.814575 , 176.192078 , 14.712074 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
