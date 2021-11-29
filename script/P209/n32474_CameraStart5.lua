-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 149.287704 , 608.823792 , 74.016624 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(173.577,634.249,46.000);]] )
   Camera:MotionSpline_AddSplinePoint( 149.287704 , 608.823792 , 74.016624 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(173.577,634.249,46.000);]] )
   Camera:MotionSpline_AddSplinePoint( 149.287704 , 608.823792 , 74.016624 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(173.577,634.249,46.000);]] )
   Camera:MotionSpline_AddSplinePoint( 149.287704 , 608.823792 , 74.016624 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(173.577,634.249,46.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
