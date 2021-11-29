-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 333.006714 , 297.403748 , 46.000000 , 28.900074 , [[Camera:ScriptSplineLookAtNpc(5260);]] )
   Camera:MotionSpline_AddSplinePoint( 333.006714 , 297.403748 , 46.000000 , 19.200037 , [[Camera:ScriptSplineLookAtNpc(5260);]] )
   Camera:MotionSpline_AddSplinePoint( 333.006714 , 297.403748 , 46.000000 , 28.800074 , [[Camera:ScriptSplineLookAtNpc(5260);]] )
   Camera:MotionSpline_AddSplinePoint( 333.006714 , 297.403748 , 46.000000 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5260);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
