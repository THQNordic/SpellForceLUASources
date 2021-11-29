-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 427.972839 , 141.475159 , 52.326691 , 19.900040 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 444.438416 , 141.212082 , 54.866859 , 7.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 468.465698 , 141.249832 , 59.526497 , 13.700016 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 501.890503 , 141.226349 , 66.533226 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(565.560,203.940,69.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.976563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
