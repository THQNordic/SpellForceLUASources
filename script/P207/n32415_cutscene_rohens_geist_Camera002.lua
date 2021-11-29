-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 380.691010 , 56.236000 , 90.253647 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(379.433,59.998,88.600);]] )
   Camera:MotionSpline_AddSplinePoint( 380.691010 , 56.236000 , 90.253647 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 380.691010 , 56.236000 , 90.253647 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 380.691010 , 56.236000 , 90.253647 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
