-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 405.000000 , 662.599976 , 30.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(405.870,667.466,27.800);]] )
   Camera:MotionSpline_AddSplinePoint( 405.000000 , 662.599976 , 30.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 405.000000 , 662.599976 , 30.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 405.000000 , 662.599976 , 30.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
