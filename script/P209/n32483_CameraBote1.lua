-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 425.774841 , 356.830566 , 27.549889 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(393.227,372.486,13.860);]] )
   Camera:MotionSpline_AddSplinePoint( 425.776123 , 356.834412 , 27.549576 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(393.227,372.486,13.860);]] )
   Camera:MotionSpline_AddSplinePoint( 425.776123 , 356.834412 , 27.549576 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(393.227,372.486,13.860);]] )
   Camera:MotionSpline_AddSplinePoint( 425.899109 , 357.209473 , 27.549576 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(393.227,372.486,13.860);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
