-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 419.965942 , 256.585724 , 20.015202 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(490.978,256.607,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 427.842926 , 227.552231 , 43.015202 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(490.978,256.607,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 447.804749 , 218.467529 , 43.015202 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(490.978,256.607,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 480.800507 , 217.327560 , 43.015202 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(490.978,256.607,17.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
