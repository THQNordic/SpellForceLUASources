-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 60.531658 , 88.517624 , 28.191750 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 60.300995 , 89.924721 , 28.061974 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 59.407253 , 91.602440 , 28.061745 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 58.014065 , 92.608971 , 28.061743 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 110.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
