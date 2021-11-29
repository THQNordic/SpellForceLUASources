-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 157.524139 , 128.992401 , 16.544800 , 9.199999 , [[Camera:ScriptSplineLookAtPosition(161.205,128.509,10);]] )
   Camera:MotionSpline_AddSplinePoint( 157.524139 , 128.992401 , 16.544800 , 6.099997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 157.524139 , 128.992401 , 16.544800 , 9.099998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 157.524139 , 128.992401 , 16.544800 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
