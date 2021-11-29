-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 575.075317 , 514.142212 , 7.866693 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8453);]] )
   Camera:MotionSpline_AddSplinePoint( 570.790466 , 518.303467 , 7.866693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 562.492798 , 518.122253 , 7.866693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 555.841980 , 513.669434 , 7.866695 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
