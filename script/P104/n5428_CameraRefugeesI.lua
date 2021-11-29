-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 639.024597 , 87.212166 , 31.051643 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(653.534,75.756,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 628.159363 , 96.844772 , 34.181629 , 16.200026 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 620.925842 , 107.827698 , 36.481815 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 602.302979 , 118.726868 , 46.501644 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
