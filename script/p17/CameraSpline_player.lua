-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 399.897461 , 121.843460 , 36.393227 , 1.900000 , [[Camera:ScriptSplineLookAtApproachingModifier(1);
Camera:ScriptSplineLookAtPosition(399.398,128.564,31.951);]] )
   Camera:MotionSpline_AddSplinePoint( 399.897461 , 121.843460 , 36.393227 , 1.200000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 399.897461 , 121.843460 , 36.393227 , 1.800000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 399.897461 , 121.843460 , 36.393227 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 2.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
