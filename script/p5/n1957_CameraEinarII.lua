-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 369.096680 , 155.579681 , 100.782669 , 11.900009 , [[Camera:ScriptSplineLookAtPosition(414.181,200.214,47.000);]] )
   Camera:MotionSpline_AddSplinePoint( 402.779144 , 125.992867 , 81.003044 , 8.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 448.978180 , 125.830841 , 79.073784 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 471.979187 , 151.228958 , 90.962990 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 1.132813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
