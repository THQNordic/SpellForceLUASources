-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 362.595154 , 400.540985 , 40.076691 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(371.046,363.449,38.890);]] )
   Camera:MotionSpline_AddSplinePoint( 362.595154 , 400.540985 , 40.076691 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 362.595154 , 400.540985 , 40.076691 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 362.595154 , 400.540985 , 40.076691 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
