-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 65.902023 , 135.873306 , 55.447754 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(70.473,158.543,40.000);]] )
   Camera:MotionSpline_AddSplinePoint( 70.637108 , 135.719269 , 55.447754 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 77.566803 , 137.221191 , 55.447754 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 87.205452 , 143.910309 , 55.447754 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
