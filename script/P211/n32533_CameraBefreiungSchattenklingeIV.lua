-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 256.088898 , 208.229248 , 28.726925 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 256.088898 , 208.229248 , 28.726925 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 256.088898 , 208.229248 , 28.726925 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 256.088898 , 208.229248 , 28.726925 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
