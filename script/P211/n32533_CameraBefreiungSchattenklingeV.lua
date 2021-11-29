-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 274.538513 , 210.160995 , 26.575510 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 275.448975 , 211.104416 , 26.575510 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 276.372162 , 212.061050 , 26.575510 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 277.155518 , 212.872772 , 26.575510 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 9.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
