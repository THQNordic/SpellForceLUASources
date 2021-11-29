-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 314.243835 , 589.669739 , 19.302464 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9305);]] )
   Camera:MotionSpline_AddSplinePoint( 319.385437 , 584.815613 , 19.302467 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 326.274353 , 584.268677 , 19.302467 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 335.442535 , 590.591919 , 17.085613 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 6.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
