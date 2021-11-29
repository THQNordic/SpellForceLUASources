-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 122.321274 , 102.395584 , 31.836107 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(121.500,104.851,31.400);]] )
   Camera:MotionSpline_AddSplinePoint( 122.321526 , 102.395103 , 31.836107 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(121.500,104.851,31.400);]] )
   Camera:MotionSpline_AddSplinePoint( 122.321526 , 102.395103 , 31.836107 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(121.500,104.851,31.400);]] )
   Camera:MotionSpline_AddSplinePoint( 122.321526 , 102.395103 , 31.836107 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(121.500,104.851,31.400);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
