-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 588.061951 , 300.073059 , 48.185059 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(610.716,282.280,34.900);]] )
   Camera:MotionSpline_AddSplinePoint( 595.381409 , 306.991913 , 46.375603 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 607.896729 , 313.698822 , 47.195053 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 624.528442 , 316.844696 , 46.595058 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
