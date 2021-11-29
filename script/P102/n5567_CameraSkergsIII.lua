-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 54.020157 , 101.817238 , 9.409822 , 17.100029 , [[Camera:ScriptSplineLookAtNpc(5951);
Camera:ScriptSplineAddTargetLookAtOffset(2.8,0,1.2);]] )
   Camera:MotionSpline_AddSplinePoint( 54.020157 , 101.817238 , 9.409822 , 11.300007 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 54.020157 , 101.817238 , 9.409822 , 17.000029 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 54.020157 , 101.817238 , 9.409822 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
