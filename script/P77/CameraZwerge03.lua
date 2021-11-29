-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 165.230362 , 278.179108 , 35.003788 , 9.600000 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
   Camera:MotionSpline_AddSplinePoint( 165.230362 , 278.179108 , 35.003788 , 6.299996 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
   Camera:MotionSpline_AddSplinePoint( 165.230362 , 278.179108 , 35.003788 , 9.500000 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
   Camera:MotionSpline_AddSplinePoint( 165.230362 , 278.179108 , 35.003788 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
