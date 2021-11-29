-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 399.474609 , 656.978027 , 28.920118 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(399.500,658.782,28.600);]] )
   Camera:MotionSpline_AddSplinePoint( 399.474609 , 656.977966 , 28.920118 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 399.474609 , 656.977966 , 28.920118 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 399.474609 , 656.977966 , 28.920118 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
