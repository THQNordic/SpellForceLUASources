-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 424.689026 , 177.080780 , 16.629637 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(412.738,160.009,12.600);]] )
   Camera:MotionSpline_AddSplinePoint( 422.556641 , 178.091782 , 16.240097 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 419.854950 , 181.400116 , 15.831871 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 416.416229 , 183.029846 , 16.179630 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
