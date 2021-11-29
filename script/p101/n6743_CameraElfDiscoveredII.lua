-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 319.583832 , 599.560303 , 19.140982 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(329.479,578.804,12.760);]] )
   Camera:MotionSpline_AddSplinePoint( 316.683594 , 597.781372 , 18.811131 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.682953 , 597.782166 , 18.810999 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.682861 , 597.782288 , 18.810982 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.682861 , 597.782288 , 18.810982 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
